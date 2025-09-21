import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/widget/top_widget.dart';
import 'package:flutter_application_1/theme/theme.dart';

class TopWithBack extends StatelessWidget {
  const TopWithBack({
    super.key,
    required this.text,
    this.title,
    this.onSearchChanged,
    this.noSearch,
    this.withDrawer,
  });

  final String text;
  final String? title;
  final ValueChanged<String>? onSearchChanged;
  final bool? noSearch, withDrawer;
  @override
  Widget build(BuildContext context) {
    return TopWidget(
      text: title,
      onSearchChanged: onSearchChanged,
      withoutSearch: noSearch,
      isText: true,
      withDrawer: withDrawer,
      widget: Text(
        text,
        style: CustomTextStyles.text14W500Primary.copyWith(
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
