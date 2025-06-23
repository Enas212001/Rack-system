import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/views/widget/add_hotel_form.dart';

import 'widget/add_form_widget.dart';

class AddHotelView extends StatelessWidget {
  const AddHotelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Hotel')),
      body: AddFormWidget(childWidget: AddHotelForm()),
    );
  }
}
