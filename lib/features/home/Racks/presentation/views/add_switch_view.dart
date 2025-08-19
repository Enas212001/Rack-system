import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_form_widget.dart';

import 'widgets/add_switch_form.dart';

class AddSwitchView extends StatelessWidget {
  const AddSwitchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: AddFormWidget(
        title: 'Switch',
        childWidget: AddSwitchForm(),
      ),
    );
  }
}
