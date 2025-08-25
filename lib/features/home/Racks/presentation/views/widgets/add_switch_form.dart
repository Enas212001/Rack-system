import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_show_dialog.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/widget/add_full_button.dart';
import 'package:flutter_application_1/core/utils/widget/custom_loading.dart';
import 'package:flutter_application_1/core/utils/widget/success_message.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/switch_cubit/switch_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddSwitchForm extends StatelessWidget {
  const AddSwitchForm({super.key, required this.buildingModel});
  final BuildingModel buildingModel;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SwitchCubit>();
    return BlocConsumer<SwitchCubit, SwitchState>(
      listener: (context, state) {
        if (state is AddSwitchFailure) {
          showToast(state.message);
        } else if (state is AddSwitchSuccess) {
          
          Navigator.pop(context);
          customShowDialog(
            context,
            widget: SuccessMessage(messageName: 'switch'),
          );
        } else if (state is AddSwitchLoading) {
          CustomLoading();
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add Switch', style: CustomTextStyles.text14W500Primary),
            SizedBox(height: 20.h),
            TitleWithTextField(
              title: 'Switch Name',
              controller: cubit.switchNameController,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Serial Number',
              controller: cubit.serialNumberController,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Mac Address',
              controller: cubit.macAddController,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'IP Adress',
              controller: cubit.ipAddController,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Up link core 1',
              controller: cubit.upLinkCore1Controller,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Up link core 2',
              controller: cubit.upLinkCore2Controller,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Port number',
              controller: cubit.portNumberController,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Model',
              controller: cubit.switchModelController,
            ),
            SizedBox(height: 40.h),
            AddFullSizeButton(
              onPressed: () {
                cubit.addSwitch(hotelId: buildingModel.hotelId!);
              },
              text: 'Save',
            ),
          ],
        );
      },
    );
  }
}
