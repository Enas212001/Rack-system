import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_form_widget.dart';

import 'widgets/add_summary_form.dart';

class AddSummaryView extends StatelessWidget {
  const AddSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: AddFormWidget(
        title: 'Summary',
        childWidget: AddSummaryForm(),
      ),
    );
  }
}
