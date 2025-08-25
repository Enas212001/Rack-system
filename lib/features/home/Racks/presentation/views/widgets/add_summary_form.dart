import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_show_dialog.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/widget/add_full_button.dart';
import 'package:flutter_application_1/core/utils/widget/custom_loading.dart';
import 'package:flutter_application_1/core/utils/widget/success_message.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/switch_cubit/switch_cubit.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/widgets/switch_drop_down.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddSummaryForm extends StatelessWidget {
  const AddSummaryForm({super.key});

  @override
  Widget build(BuildContext context) {
    final switchCubit = context.read<SwitchCubit>();
    return BlocConsumer<SwitchCubit, SwitchState>(
      listener: (context, state) {
        if (state is AddSummaryFailure) {
          showToast(state.message);
        } else if (state is AddSummarySuccess) {
          Navigator.pop(context);
          customShowDialog(
            context,
            widget: SuccessMessage(messageName: 'summary'),
          );
        } else if (state is AddSummaryLoading) {
          CustomLoading();
        }
      },
      builder: (context, state) {
        return Form(
          key: switchCubit.formAddSummaryKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Add Summary', style: CustomTextStyles.text14W500Primary),
              SizedBox(height: 20.h),
              SwitchDropDown(
                value: switchCubit.switchItem,
                onChanged: (value) => switchCubit.switchItem = value,
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'CCTV in',
                controller: switchCubit.cctvInController,
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'CCTV out',
                controller: switchCubit.cctvOutController,
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'Ap Room',
                controller: switchCubit.apRoomController,
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'Ap Out',
                controller: switchCubit.apOutController,
              ),
              SizedBox(height: 40.h),
              AddFullSizeButton(
                onPressed: () => switchCubit.addSummary(),
                text: 'Save',
              ),
            ],
          ),
        );
      },
    );
  }
}
