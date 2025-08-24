import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_form_widget.dart';
import 'package:flutter_application_1/features/users/presentation/manager/cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/add_user_form.dart';

class AddUserView extends StatelessWidget {
  const AddUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context) => UserCubit(),
        child: AddFormWidget(title: 'User', childWidget: AddUserForm()),
      ),
    );
  }
}
