import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/views/widgets/top_widget.dart';
import 'package:flutter_application_1/theme/theme.dart';

import 'back_icon.dart';

class TopWithBack extends StatelessWidget {
  const TopWithBack({
    super.key,
    required this.text,
    this.title,
    this.onSearchChanged,
    this.isRack,
  });

  final String text;
  final String? title;
  final ValueChanged<String>? onSearchChanged;
  final bool? isRack;
  @override
  Widget build(BuildContext context) {
    return TopWidget(
      text: title,
      onSearchChanged: onSearchChanged,
      isRack: isRack,
      widget: Row(
        children: [
          BackIcon(),
          Spacer(flex: 2),
          Text(
            text,
            style: CustomTextStyles.text14W500Primary.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}
