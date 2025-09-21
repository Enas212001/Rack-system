import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/expand_info_card.dart';
import 'package:flutter_application_1/features/users/data/models/user_model/user_item.dart';
import 'package:flutter_application_1/features/users/presentation/views/widgets/user_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({super.key, required this.userModel});
  final UserItem userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: ExpandableInfoCard(
        title: userModel.name!,
        details: UserDetails(userModel: userModel),
      ),
    );
  }
}
