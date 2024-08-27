import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_test/src/config/resources/app_colors.dart';
import 'package:flutter_ui_test/src/screens/widgets/app_spacer.dart';
import 'package:flutter_ui_test/src/screens/widgets/custom_text.dart';

class Button extends StatelessWidget {
  final String text;
  final bool hasBorder;
  final String? image;
  final Function() onTap;
  const Button(
      {super.key,
      required this.text,
      this.image,
      this.hasBorder = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
                color: hasBorder ? AppColors.textColor : Colors.transparent),
            borderRadius: BorderRadius.circular(100),
            color: hasBorder ? AppColors.white : AppColors.primary),
        child: image == null
            ? Center(
                child: customText(
                    text: text,
                    fontSize: 16,
                    textColor:
                        hasBorder ? AppColors.textColor : AppColors.white),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(image!),
                  widthSpace(2),
                  Center(
                    child: customText(
                        text: text,
                        fontSize: 16,
                        textColor:
                            hasBorder ? AppColors.textColor : AppColors.white),
                  ),
                ],
              ),
      ),
    );
  }
}
