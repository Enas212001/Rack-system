import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/utils/widget/back_icon.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/home/Hotels/presentation/views/widgets/top_widget.dart';

class TopAddWidget extends StatelessWidget {
  const TopAddWidget({
    super.key,
    this.title,
    this.isEdit = false,
    this.isAddUser = false,
  });
  final String? title;
  final bool isEdit, isAddUser;
  @override
  Widget build(BuildContext context) {
    return TopWidget(
      isAdd: true,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isAddUser
              ? IconButton(
                  icon: Icon(Icons.menu, color: AppColors.whiteColor),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                )
              : BackIcon(),
          Text(
            isEdit ? 'Edit $title' : '${AppStrings.add} $title',
            style: CustomTextStyles.text14W500Primary.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}
