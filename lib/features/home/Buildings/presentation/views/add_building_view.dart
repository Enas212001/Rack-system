import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_form_widget.dart';

import 'widgets/add_building_form.dart';

class AddBuildingView extends StatelessWidget {
  const AddBuildingView({super.key, required this.hotelId});
  final String hotelId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AddFormWidget(
        title: 'Building',
        childWidget: AddBuildingForm(hotelId: hotelId),
      ),
    );
  }
}
