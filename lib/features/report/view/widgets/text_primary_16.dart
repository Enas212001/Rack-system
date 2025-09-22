import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';

class Text16MeduimPrimaryColor extends StatelessWidget {
  const Text16MeduimPrimaryColor({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CustomTextStyles.text16MeduimText.copyWith(
        color: AppColors.primaryColor,
      ),
    );
  }
}
