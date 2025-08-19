import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/border_text_field.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.title,
    this.hintText,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String title;
  final String? hintText;
  final bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      enableSuggestions: true,
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.title}';
        }
        return null;
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: borderTextField(),
        focusedBorder: borderTextField(),
        enabledBorder: borderTextField(),
        hintText: widget.hintText,
        hintStyle: CustomTextStyles.text14Regular.copyWith(
          color: AppColors.textColor,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.greyColor,
                ),
                onPressed: _toggleVisibility,
              )
            : null,
      ),
    );
  }

}
