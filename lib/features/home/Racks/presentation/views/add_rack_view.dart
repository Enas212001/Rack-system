import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/widget/add_form_widget.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/widgets/add_rack_form.dart';

class AddRackView extends StatelessWidget {
  const AddRackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Rack')),
      body: AddFormWidget(childWidget: AddRackForm()),
    );
  }
}
