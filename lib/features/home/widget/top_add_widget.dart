import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/home/widget/back_icon.dart';
import 'package:flutter_application_1/theme/theme.dart';

import '../Hotels/presentation/views/widgets/top_widget.dart';

class TopAddWidget extends StatelessWidget {
  const TopAddWidget({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return TopWidget(
      isAdd: true,
      widget: Row(
        children: [
          BackIcon(),
          Spacer(flex: 2),
          Text(
            'Add $title',
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
