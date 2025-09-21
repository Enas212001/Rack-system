import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/add_form_widget.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/widgets/add_rack_form.dart';

class AddRackView extends StatelessWidget {
  const AddRackView({super.key, required this.buildingModel});
  final BuildingModel buildingModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AddFormWidget(
        title: 'Rack',
        childWidget: AddRackForm(buildingModel: buildingModel),
      ),
    );
  }
}
