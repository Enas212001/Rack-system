import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';

class NotificationsNumberWidget extends StatelessWidget {
  const NotificationsNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'You have',
        style: Theme.of(context).textTheme.titleSmall,
        children: [
          TextSpan(
            text: ' 2 Unread',
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: AppColors.primaryColor),
          ),
          TextSpan(
            text: ' Notifications',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
