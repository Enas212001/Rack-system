import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppColors.primaryColor),
    );
  }
}
