import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_form_widget.dart';

import 'widgets/add_device_form.dart';

class AddDeviceView extends StatelessWidget {
  const AddDeviceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddFormWidget(title: 'Device', childWidget: AddDeviceForm()),
    );
  }
}
