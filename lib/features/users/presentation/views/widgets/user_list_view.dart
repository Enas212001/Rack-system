import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'user_item.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor, width: 1.r),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
                width: double.infinity,
                color: AppColors.backgroundColor,
                child: Text('Name', style: CustomTextStyles.text14W500Primary),
              ),
              Divider(height: 1, color: AppColors.borderColor),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => Column(
                  children: [
                    GestureDetector(onTap: () {}, child: UserItem()),
                    if (index < index - 1)
                      const Divider(height: 1, color: AppColors.borderColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}