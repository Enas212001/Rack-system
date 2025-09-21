import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_show_dialog.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/core/widget/success_message.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/rack_cubit/rack_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widget/add_full_button.dart';
import 'switch_multiple_select.dart';

class AddRackForm extends StatelessWidget {
  const AddRackForm({super.key, required this.buildingModel});
  final BuildingModel buildingModel;
  @override
  Widget build(BuildContext context) {
    RackCubit rackCubit = BlocProvider.of<RackCubit>(context);
    return BlocConsumer<RackCubit, RackState>(
      listener: (context, state) {
        if (state is AddRackSuccess) {
          rackCubit.getRacksInfo(buildingId: buildingModel.id!.toString());
          Navigator.pop(context);
          customShowDialog(
            context,
            widget: SuccessMessage(messageName: 'rack'),
          );
        } else if (state is AddRackFailure) {
          log(state.message);
          showToast('Failed to add rack');
        } else if (state is AddRackLoading) {
          CustomLoading();
        }
      },
      builder: (context, state) {
        return Form(
          key: rackCubit.formAddRackKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Add New Rack', style: CustomTextStyles.text14W500Primary),
              SizedBox(height: 20.h),
              TitleWithTextField(
                title: 'Rack name',
                controller: rackCubit.rackNameController,
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'Site Name',
                controller: rackCubit.siteNameController,
              ),
              SizedBox(height: 10.h),
              SwitchMultipleSelect(
                selectedSwitchs: rackCubit.selectedSwitchs,
                onConfirm: (values) {
                  rackCubit.selectedSwitchs = values;
                },
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'Rack Size',
                controller: rackCubit.rackSizeController,
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'Rack Model',
                controller: rackCubit.rackModelController,
              ),
              SizedBox(height: 40.h),
              AddFullSizeButton(
                onPressed: () {
                  if (rackCubit.formAddRackKey.currentState!.validate()) {
                    rackCubit.addRack(building: buildingModel);
                  }
                },
                text: 'Save',
              ),
            ],
          ),
        );
      },
    );
  }
}
