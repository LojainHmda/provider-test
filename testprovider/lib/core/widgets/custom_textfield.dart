import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/utils/app_colors.dart';

import '../providers/theme_provider.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    this.maxline,
    this.prefixIcon,
    this.suffixIcon,
    this.color,
    required this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.obscureText = false,
    this.validator,
  });
  final TextEditingController controller;
  final int? maxline;
  OutlineInputBorder? border;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? color;
  String hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  bool obscureText;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    print(color);

    return TextFormField(
      validator: validator ??
          (text) {
            if (text == null || text.isEmpty) {
              return "This field is required";
            }
            return null;
          },
      controller: controller,
      maxLines: maxline,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: hintStyle ?? const TextStyle(color: AppColors.greyColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: color ??
                (theme.theme == ThemeMode.dark
                    ? AppColors.primaryDark
                    : AppColors.primaryLight),
          ),
        ),
      ),
    );
  }
}
