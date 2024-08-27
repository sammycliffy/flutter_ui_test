import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_test/src/config/resources/app_colors.dart';
import 'package:flutter_ui_test/src/config/resources/app_images.dart';
import 'package:flutter_ui_test/src/screens/start_page.dart';
import 'package:flutter_ui_test/src/screens/widgets/app_spacer.dart';
import 'package:flutter_ui_test/src/screens/widgets/custom_text.dart';

class SecondOnboarding extends StatelessWidget {
  const SecondOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 133,
                    decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(AppImages.bubble),
                      ),
                    ),
                  ),
                ),
                widthSpace(3),
                SvgPicture.asset(AppImages.blueContainer)
              ],
            ),
            heightSpace(3),
            Image.asset(AppImages.onboardingTruck),
            heightSpace(4),
            customText(
                textAlignment: TextAlign.center,
                text: "Solution for drivers \nstriving for \nsuccessful work",
                fontSize: 32,
                textColor: AppColors.textColor,
                fontWeight: FontWeight.w700),
            heightSpace(2),
            customText(
              textAlignment: TextAlign.center,
              text: "Be part of a new era of work with this innovative app",
              fontSize: 14,
              textColor: AppColors.textColor,
            ),
            heightSpace(5),
            GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const StartPage())),
                child: SvgPicture.asset(AppImages.progressButton))
          ]),
        ),
      ),
    );
  }
}
