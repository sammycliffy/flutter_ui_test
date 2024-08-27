import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_test/src/config/resources/app_images.dart';
import 'package:flutter_ui_test/src/screens/select_account.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SelectAccount()),
        ),
      );
      return null;
    }, []);
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppImages.logo),
      ),
    );
  }
}
