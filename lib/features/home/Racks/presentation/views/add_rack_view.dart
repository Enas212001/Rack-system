import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_form_widget.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/widgets/add_rack_form.dart';

class AddRackView extends StatelessWidget {
  const AddRackView({super.key, required this.buildingRId});
  final String buildingRId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AddFormWidget(
        title: 'Rack',
        childWidget: AddRackForm(buildingRId: buildingRId),
      ),
    );
  }
}
