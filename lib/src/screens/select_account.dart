import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_test/src/config/resources/app_colors.dart';
import 'package:flutter_ui_test/src/config/resources/app_images.dart';
import 'package:flutter_ui_test/src/screens/first_onboarding.dart';
import 'package:flutter_ui_test/src/screens/widgets/app_spacer.dart';
import 'package:flutter_ui_test/src/screens/widgets/button.dart';
import 'package:flutter_ui_test/src/screens/widgets/custom_text.dart';

class SelectAccount extends StatelessWidget {
  const SelectAccount({super.key});

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
            customText(
                text: "👋🏻 Hello",
                fontSize: 32,
                textColor: AppColors.textColor,
                fontWeight: FontWeight.w700),
            heightSpace(2),
            customText(
                text: "Choose how you will use the app for better experience",
                fontSize: 14,
                textColor: AppColors.bodyTextColor),
            heightSpace(3),
            Button(
              text: "I'm a driver",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FirstOnboarding())),
            ),
            heightSpace(2),
            Button(
              text: "I'm a mechanic",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FirstOnboarding())),
              hasBorder: true,
            ),
            heightSpace(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(
                    text: "Already have an account?",
                    fontSize: 14,
                    textColor: AppColors.bodyTextColor),
                widthSpace(1),
                customText(
                    text: "Login", fontSize: 14, textColor: AppColors.primary)
              ],
            )
          ],
        ),
      ),
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(AppImages.global)),
              heightSpace(25),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: SvgPicture.asset(AppImages.backgraoundLogo),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
