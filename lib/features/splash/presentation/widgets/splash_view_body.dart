import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:e_commerce_app/core/routes_manager/routes_manager.dart';
import 'package:e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    navigator();
  }

  Future<Object?> navigator() async {
    bool isOnBoardingViewSeen = await Prefs.getBoolean(kIsOnboardingViewSeen);
    return Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        if (isOnBoardingViewSeen) {
          return Navigator.pushReplacementNamed(context, RoutesManager.login);
        } else {
          return Navigator.pushReplacementNamed(
            context,
            RoutesManager.onBoarding,
          );
        }
      } else {
        return null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [SvgPicture.asset(AssetsManager.splashLogo1)]),
        SvgPicture.asset(AssetsManager.splashLogo2),
        SvgPicture.asset(AssetsManager.splashLogo3),
      ],
    );
  }
}
