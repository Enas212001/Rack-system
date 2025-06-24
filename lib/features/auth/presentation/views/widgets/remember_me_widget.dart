import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/presentation/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        bool isChecked = false;
        if (state is LoginCheckboxChanged) {
          isChecked = state.rememberMe;
        } else if (context.read<LoginCubit>().rememberMe) {
          isChecked = true;
        }
        return Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (newValue) {
                context.read<LoginCubit>().toggleRememberMe(value: newValue);
              },
            ),
            const Text('Remember Me'),
          ],
        );
      },
    );
  }
}
