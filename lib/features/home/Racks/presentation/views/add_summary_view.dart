import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_form_widget.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/switch_cubit/switch_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/add_summary_form.dart';

class AddSummaryView extends StatelessWidget {
  const AddSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context) => SwitchCubit(),
        child: AddFormWidget(title: 'Summary', childWidget: AddSummaryForm()),
      ),
    );
  }
}
