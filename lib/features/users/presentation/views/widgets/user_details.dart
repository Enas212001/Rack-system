import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/delete_widget.dart';
import 'package:flutter_application_1/core/widget/item_detail.dart';
import 'package:flutter_application_1/features/users/data/models/user_model/user_item.dart';
import 'package:flutter_application_1/features/users/presentation/manager/cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.userModel});
  final UserItem userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDetail(label: 'Email', value: userModel.email!),
          ItemDetail(label: 'Role', value: userModel.roleId!),
          ItemDetail(
            label: 'Actions',
            isAction: true,
            isUser: true,
            onDelete: () {
              showDialog(
                context: context,
                builder: (dialogContext) => DeleteWidget(
                  onDelete: () {
                    Navigator.pop(context);
                    context.read<UserCubit>().deleteUsersInfo(
                      userId: userModel.id.toString(),
                    );
                  },
                  title: 'User',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
