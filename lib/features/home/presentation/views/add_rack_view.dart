import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/views/widget/add_rack_form.dart';

class AddRackView extends StatelessWidget {
  const AddRackView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Add New Rack')),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: AddRackForm(),
          ),
        ),
      ),
    );
  }
}