import 'package:flutter/material.dart';

import 'widget/add_building_form.dart';

class AddBuildingView extends StatelessWidget {
  const AddBuildingView({super.key, required this.hotelId});
  final String hotelId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Building')),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: AddBuildingForm(hotelId: hotelId),
          ),
        ),
      ),
    );
  }
}
