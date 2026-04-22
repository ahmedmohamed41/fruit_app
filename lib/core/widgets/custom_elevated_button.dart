import 'package:e_commerce_app/core/resources/colors_manager.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isEnabled;
  const CustomButton({
    super.key,

    required this.title,
    required this.onPressed,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,

        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled
              ? ColorsManager.green500
              : ColorsManager.grayScale,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: CustomText(
          text: title,
          fontWeight: FontWeight.w900,
          size: 16,
          color: ColorsManager.white,
        ),
      ),
    );
  }
}
