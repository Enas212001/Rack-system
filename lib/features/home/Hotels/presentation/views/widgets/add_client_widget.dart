import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';

import 'add_user_button.dart';

class AddClientWidget extends StatelessWidget {
  const AddClientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Our Clients',
          style: CustomTextStyles.text14Regular.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        Spacer(),
        AddUserButton(),
      ],
    );
  }
}
