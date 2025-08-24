import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/expand_info_card.dart';
import 'package:flutter_application_1/features/users/presentation/views/widgets/user_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: ExpandableInfoCard(title: 'User', details: UserDetails()),
    );
  }
}
