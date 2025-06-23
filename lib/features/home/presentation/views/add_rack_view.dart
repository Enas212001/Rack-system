import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/manager/cubit/rack_cubit.dart';
import 'package:flutter_application_1/features/home/presentation/views/widget/add_form_widget.dart';
import 'package:flutter_application_1/features/home/presentation/views/widget/add_rack_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRackView extends StatelessWidget {
  const AddRackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Rack')),
      body: BlocProvider(
        create: (context) => RackCubit(),
        child: AddFormWidget(childWidget: AddRackForm()),
      ),
    );
  }
}
