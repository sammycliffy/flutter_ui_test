import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_test/src/config/resources/app_colors.dart';
import 'package:flutter_ui_test/src/config/resources/app_images.dart';
import 'package:flutter_ui_test/src/screens/dashboard.dart';
import 'package:flutter_ui_test/src/screens/first_onboarding.dart';
import 'package:flutter_ui_test/src/screens/widgets/app_spacer.dart';
import 'package:flutter_ui_test/src/screens/widgets/button.dart';
import 'package:flutter_ui_test/src/screens/widgets/custom_text.dart';
import 'package:flutter_ui_test/src/screens/widgets/custom_textform.dart';
import 'package:flutter_ui_test/src/screens/widgets/toast.dart';

class LoginPage extends HookWidget {
  LoginPage({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final rememberMe = useState<bool>(false);
    final isLoading = useState<bool>(false);
    Future<void> signInWithEmail() async {
      if (_formKey.currentState?.validate() ?? false) {
        isLoading.value = true;
        try {
          UserCredential userCredential =
              await _auth.signInWithEmailAndPassword(
            email: email.text,
            password: password.text,
          );
          isLoading.value = false;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Dashboard()));
          // Successful sign-in
        } on FirebaseAuthException catch (e) {
          isLoading.value = false;
          log(e.toString());
          // Handle the error and show a message to the user
          ToastResp.toastMsgError(resp: e.toString());
          if (e.code == 'user-not-found') {
            _formKey.currentState?.validate();
          } else if (e.code == 'wrong-password') {
            _formKey.currentState?.validate();
          }
        }
      }
    }

    return Scaffold(
        bottomSheet: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              color: AppColors.white),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                    textEditingController: email,
                    hintText: "Input your registered email or phone",
                    labelText: "Email or phone number",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add more email validation logic if needed
                      return null;
                    }),
                heightSpace(2),
                CustomTextFormField(
                    textEditingController: password,
                    isPassword: true,
                    hintText: "Input your password",
                    labelText: "Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    }),
                heightSpace(2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        rememberMe.value
                            ? GestureDetector(
                                onTap: () =>
                                    rememberMe.value = !rememberMe.value,
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.primary),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () =>
                                    rememberMe.value = !rememberMe.value,
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: AppColors.bodyTextColor)),
                                ),
                              ),
                        widthSpace(2),
                        customText(
                            text: "Remember Me",
                            fontSize: 14,
                            textColor: AppColors.bodyTextColor)
                      ],
                    ),
                    customText(
                        text: "Forgot Password",
                        fontSize: 14,
                        textColor: AppColors.bodyTextColor)
                  ],
                ),
                heightSpace(3),
                isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Button(
                        text: "Login",
                        onTap: () => signInWithEmail(),
                      ),
                heightSpace(3),
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FirstOnboarding())),
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
        ),
        backgroundColor: AppColors.darkBlue,
        body: Column(
          children: [
            heightSpace(20),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: SvgPicture.asset(AppImages.logoIcon),
              ),
            ),
            heightSpace(1),
            Center(
              child: customText(
                  text: "Welcome Back!",
                  fontSize: 32,
                  textColor: AppColors.white),
            ),
            heightSpace(1),
            Center(
              child: customText(
                  text: "Please login first to start your Udrive",
                  fontSize: 14,
                  textColor: AppColors.white),
            )
          ],
        ));
  }
}
