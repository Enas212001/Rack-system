import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_application_1/features/home/presentation/views/widget/add_full_button.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBuildingForm extends StatelessWidget {
  const AddBuildingForm({super.key, required this.hotelId});
  final String hotelId;
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is AddBuildingSuccess) {
          showToast('Building added successfully');
          homeCubit.getBuildings(hotelId: hotelId);
          Navigator.pop(context);
        } else if (state is AddBuildingFailure) {
          log(state.message);
          showToast('Failed to add building');
        } else if (state is AddBuildingLoading) {
          showToast('Loading...');
        }
      },
      builder: (context, state) {
        return Form(
          key: homeCubit.formAddBuildingKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Add New Building', style: CustomTextStyles.text20Bold),
                SizedBox(height: 20),
                TitleWithTextField(
                  title: 'Rack ID',
                  controller: homeCubit.rackIdController,
                  hintText: 'Enter Rack ID',
                ),
                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Building Rack ID',
                  controller: homeCubit.buildingRackIdController,
                  hintText: 'Enter Building Rack ID',
                ),

                SizedBox(height: 10),
                TitleWithTextField(
                  title: 'Building Name',
                  controller: homeCubit.buildingNameController,
                  hintText: 'Enter Building Name',
                ),
                SizedBox(height: 10),
                // DropdownButtonFormField<String>(
                //   value: _selectedHotel,
                //   decoration: InputDecoration(labelText: 'Select Hotel'),
                //   items: _hotels.map((hotel) {
                //     return DropdownMenuItem(
                //       value: hotel,
                //       child: Text(hotel),
                //     );
                //   }).toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       _selectedHotel = value;
                //     });
                //   },
                //   validator: (value) =>
                //       value == null ? 'Select a hotel' : null,
                // ),
                SizedBox(height: 20),
                AddFullSizeButton(
                  onPressed: () {
                    if (homeCubit.formAddBuildingKey.currentState!.validate()) {
                      homeCubit.addBuilding(hotelId: hotelId);
                    }
                  },
                  text: 'Add Building',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
