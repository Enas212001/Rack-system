import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_form_widget.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/cubit/building_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/edit_building_form.dart';

class EditBuildingView extends StatelessWidget {
  const EditBuildingView({super.key, required this.building});
  final BuildingModel building;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context) => BuildingCubit(),
        child: AddFormWidget(
          title: 'Building',
          isEdit: true,
          childWidget: EditBuildingForm(building: building),
        ),
      ),
    );
  }
}
