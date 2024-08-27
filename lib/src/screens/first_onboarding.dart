import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_test/src/config/resources/app_colors.dart';
import 'package:flutter_ui_test/src/config/resources/app_images.dart';
import 'package:flutter_ui_test/src/screens/second_onboarding.dart';
import 'package:flutter_ui_test/src/screens/widgets/app_spacer.dart';
import 'package:flutter_ui_test/src/screens/widgets/button.dart';
import 'package:flutter_ui_test/src/screens/widgets/custom_text.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        width: double.infinity,
        height: 350,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            color: AppColors.white),
        child: Column(
          children: [
            Center(
              child: customText(
                  textAlignment: TextAlign.center,
                  text: "Make your way more comfortable",
                  fontSize: 32,
                  textColor: AppColors.textColor,
                  fontWeight: FontWeight.w700),
            ),
            heightSpace(2),
            customText(
                textAlignment: TextAlign.center,
                text:
                    "Find the mechanic along the entire route without interrupting your route using this platform.",
                fontSize: 14,
                textColor: AppColors.bodyTextColor),
            heightSpace(2),
            GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondOnboarding())),
                child: SvgPicture.asset(AppImages.progressButton))
          ],
        ),
      ),
      backgroundColor: AppColors.primary,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 35, bottom: 30),
          child: Image.asset(AppImages.mobile),
        ),
      )),
    );
  }
}
