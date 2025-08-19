import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_form_widget.dart';

import 'widgets/edit_device_form.dart';

class EditDeviceView extends StatelessWidget {
  const EditDeviceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: AddFormWidget(
        title: 'Device',
        childWidget: EditDeviceForm(),
        isEdit: true,
      ),
    );
  }
}
