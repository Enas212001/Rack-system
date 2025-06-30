import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_show_dialog.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/widgets/custom_loading.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/Buildings/cubit/building_cubit.dart';
import 'package:flutter_application_1/features/home/widget/add_full_button.dart';
import 'package:flutter_application_1/features/home/widget/success_message.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBuildingForm extends StatelessWidget {
  const AddBuildingForm({super.key, required this.hotelId});
  final String hotelId;
  @override
  Widget build(BuildContext context) {
    BuildingCubit buildingCubit = BlocProvider.of<BuildingCubit>(context);
    return BlocConsumer<BuildingCubit, BuildingState>(
      listener: (context, state) {
        if (state is AddBuildingSuccess) {
          buildingCubit.getBuildings(hotelId: hotelId);
          Navigator.pop(context);
          customShowDialog(
            context,
            widget: SuccessMessage(messageName: 'Building'),
          );
        } else if (state is AddBuildingFailure) {
          log(state.message);
          showToast('Failed to add building');
        } else if (state is AddBuildingLoading) {
          CustomLoading();
        }
      },
      builder: (context, state) {
        return Form(
          key: buildingCubit.formAddBuildingKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add New Building',
                  style: CustomTextStyles.text14W500Primary,
                ),
                SizedBox(height: 20.h),
                TitleWithTextField(
                  title: 'Rack ID',
                  controller: buildingCubit.rackIdController,
                  hintText: 'Enter your Rack ID',
                ),
                SizedBox(height: 10.h),
                TitleWithTextField(
                  title: 'Building Rack ID',
                  controller: buildingCubit.buildingRackIdController,
                  hintText: 'Enter Building Rack ID',
                ),
                SizedBox(height: 10.h),
                TitleWithTextField(
                  title: 'Building Name',
                  controller: buildingCubit.buildingNameController,
                  hintText: 'Enter Building Name',
                ),
                SizedBox(height: 10.h),
                AddFullSizeButton(
                  onPressed: () {
                    if (buildingCubit.formAddBuildingKey.currentState!
                        .validate()) {
                      buildingCubit.addBuilding(hotelId: hotelId);
                    }
                  },
                  text: 'Submit',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
