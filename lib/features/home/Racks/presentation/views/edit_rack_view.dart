import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_form_widget.dart';

import 'widgets/edit_rack_form.dart';

class EditRackView extends StatelessWidget {
  const EditRackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddFormWidget(
        title: 'Rack',
        childWidget: EditRackForm(),
        isEdit: true,
      ),
    );
  }
}
