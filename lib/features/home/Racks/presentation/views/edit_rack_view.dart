import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_form_widget.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_model/rack_item.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/cubit/rack_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/edit_rack_form.dart';

class EditRackView extends StatelessWidget {
  const EditRackView({super.key, required this.rack});
  final RackItem rack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RackCubit(),
        child: AddFormWidget(
          title: 'Rack',
          childWidget: EditRackForm(rack: rack),
          isEdit: true,
        ),
      ),
    );
  }
}
