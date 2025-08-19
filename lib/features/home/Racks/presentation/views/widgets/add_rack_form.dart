import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_show_dialog.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/widget/custom_loading.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/cubit/rack_cubit.dart';
import 'package:flutter_application_1/core/utils/widget/success_message.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/widget/add_full_button.dart';

class AddRackForm extends StatelessWidget {
  const AddRackForm({super.key, required this.buildingRId});
  final String buildingRId;
  @override
  Widget build(BuildContext context) {
    RackCubit rackCubit = BlocProvider.of<RackCubit>(context);
    return BlocConsumer<RackCubit, RackState>(
      listener: (context, state) {
        if (state is AddRackSuccess) {
          rackCubit.getRacksInfo(buildingRId: buildingRId);
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
              Text('Add Rack', style: CustomTextStyles.text14W500Primary),
              SizedBox(height: 20.h),
              TitleWithTextField(
                title: 'Rack name',
                controller: rackCubit.productPanelController,
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'Site Name',
                controller: rackCubit.productSerialController,
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'Rack Size',
                controller: rackCubit.productMacController,
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'Rack Model',
                controller: rackCubit.productModelController,
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'Switches',
                controller: rackCubit.productPortController,
              ),
              SizedBox(height: 40.h),
              AddFullSizeButton(
                onPressed: () {
                  if (rackCubit.formAddRackKey.currentState!.validate()) {
                    rackCubit.addRack(buildingRId: buildingRId);
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
