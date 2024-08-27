import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_test/src/config/resources/app_colors.dart';

class CustomTextFormField extends HookWidget {
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final TextEditingController textEditingController;
  final bool isPassword;
  const CustomTextFormField(
      {super.key,
      this.errorText,
      this.validator,
      this.hintText,
      this.labelText,
      this.isPassword = false,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    final showIcon = useState<bool>(false);

    return TextFormField(
      controller: textEditingController,
      validator: validator,
      obscureText: isPassword
          ? showIcon.value
              ? false
              : true
          : false,
      decoration: InputDecoration(
          suffixIcon: isPassword
              ? GestureDetector(
                  onTap: () => showIcon.value = !showIcon.value,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      showIcon.value ? Icons.visibility : Icons.visibility_off,
                      size: 25,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          // errorText: errorText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: AppColors.primary)),
          hintText: hintText,
          labelText: labelText),
    );
  }
}
