import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_test/src/config/resources/app_colors.dart';
import 'package:flutter_ui_test/src/config/resources/app_images.dart';
import 'package:flutter_ui_test/src/screens/first_onboarding.dart';
import 'package:flutter_ui_test/src/screens/login_page.dart';
import 'package:flutter_ui_test/src/screens/widgets/app_spacer.dart';
import 'package:flutter_ui_test/src/screens/widgets/button.dart';
import 'package:flutter_ui_test/src/screens/widgets/custom_text.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        width: double.infinity,
        height: 400,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            color: AppColors.white),
        child: Column(
          children: [
            customText(
                textAlignment: TextAlign.center,
                text: "Your Successful Journey Starts Here",
                fontSize: 32,
                textColor: AppColors.textColor,
                fontWeight: FontWeight.w700),
            heightSpace(2),
            customText(
                text:
                    "Take your drive career to the next level with this  app.",
                fontSize: 14,
                textColor: AppColors.bodyTextColor),
            heightSpace(2),
            Button(
              text: "Login to Account",
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage())),
            ),
            heightSpace(2),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Button(
                    image: AppImages.google,
                    text: "Google",
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FirstOnboarding())),
                    hasBorder: true,
                  ),
                ),
                widthSpace(2),
                Flexible(
                  flex: 1,
                  child: Button(
                    image: AppImages.apple,
                    text: "Apple",
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage())),
                    hasBorder: true,
                  ),
                )
              ],
            ),
            heightSpace(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(
                    text: "New to udrive?",
                    fontSize: 14,
                    textColor: AppColors.bodyTextColor),
                widthSpace(1),
                customText(
                    text: "Create Account",
                    fontSize: 14,
                    textColor: AppColors.primary)
              ],
            )
          ],
        ),
      ),
      backgroundColor: AppColors.primary,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.truck), // Replace with your image path
            fit: BoxFit.cover, // Cover the entire background
          ),
        ),
      ),
    );
  }
}
