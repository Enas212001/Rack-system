import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/manager/cubit/building_cubit.dart';
import 'package:flutter_application_1/features/home/presentation/views/widget/add_form_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/add_building_form.dart';

class AddBuildingView extends StatelessWidget {
  const AddBuildingView({super.key, required this.hotelId});
  final String hotelId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Building')),
      body: BlocProvider(
        create: (context) => BuildingCubit(),
        child: AddFormWidget(childWidget: AddBuildingForm(hotelId: hotelId)),
      ),
    );
  }
}
