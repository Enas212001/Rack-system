import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/widget/add_form_widget.dart';

import 'widgets/edit_building_form.dart';

class EditBuildingView extends StatelessWidget {
  const EditBuildingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AddFormWidget(
        title: 'Building',
        childWidget: EditBuildingForm(),
      ),
    );
  }
}
