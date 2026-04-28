import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/colors_manager.dart';
import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:e_commerce_app/core/routes_manager/routes_manager.dart';
import 'package:e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce_app/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/on_boarding/models/onboarding_model.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/widgets/custom_curve_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  List<OnboardingModel> pages = [
    OnboardingModel(
      image: AssetsManager.fruitBasket,
      title: 'FruitHUB مرحباً بك في',
      subtitle:
          'اكتشف تجربة تسوق فريدة مع FruitHUB استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة',
      backgroundColor: ColorsManager.orange,
    ),
    OnboardingModel(
      image: AssetsManager.pineapple,
      title: 'ابحث وتسوق',
      subtitle:
          'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيارك.',
      backgroundColor: ColorsManager.green200,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) =>
                setState(() => isLastPage = index == pages.length - 1),
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  ClipPath(
                    clipper: CustomCurveClipper(),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      color: pages[index].backgroundColor,
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(height: 60),
                        SvgPicture.asset(
                          pages[index].image,
                          height: 350,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 40),
                        CustomText(
                          text: pages[index].title,
                          size: 24,
                          fontWeight: FontWeight.bold,
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          child: CustomText(
                            text: pages[index].subtitle,
                            textAlign: TextAlign.center,
                            size: 15,
                            color: ColorsManager.grayScale,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          if (!isLastPage)
            Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: () {
                  Prefs.setBoolean(kIsOnboardingViewSeen, true);
                  Navigator.pushReplacementNamed(context, RoutesManager.login);
                },
                child: CustomText(text: 'تخط', color: ColorsManager.grayScale),
              ),
            ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 2,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: ColorsManager.green500,
                    dotColor: ColorsManager.green200,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                const SizedBox(height: 30),
                if (isLastPage)
                  CustomButton(
                    title: 'ابدأ الآن',
                    isEnabled: true,
                    onPressed: () {
                      Prefs.setBoolean(kIsOnboardingViewSeen, true);
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesManager.login,
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
