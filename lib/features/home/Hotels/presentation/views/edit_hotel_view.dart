import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/widget/add_form_widget.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/cubit/hotel_cubit.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/views/widgets/edit_hotel_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditHotelView extends StatelessWidget {
  const EditHotelView({super.key, required this.hotel});
  final HotelModel hotel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context) => HotelCubit(),
        child: AddFormWidget(
          isEdit: true,
          title: AppStrings.hotel,
          childWidget: EditHotelForm(hotel: hotel),
        ),
      ),
    );
  }
}
