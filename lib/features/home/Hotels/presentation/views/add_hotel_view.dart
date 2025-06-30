import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/views/widgets/add_hotel_form.dart';

import '../../../widget/add_form_widget.dart';

class AddHotelView extends StatelessWidget {
  const AddHotelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AddFormWidget(title: 'Hotel', childWidget: AddHotelForm()),
    );
  }
}
