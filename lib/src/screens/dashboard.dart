import 'package:flutter/material.dart';
import 'package:flutter_ui_test/src/config/resources/app_colors.dart';
import 'package:flutter_ui_test/src/screens/widgets/custom_text.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: customText(
          text: "Hi Welcome", fontSize: 32, textColor: AppColors.bodyTextColor),
    ));
  }
}
