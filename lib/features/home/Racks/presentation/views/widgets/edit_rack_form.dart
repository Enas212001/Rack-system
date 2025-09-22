import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_show_dialog.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/widget/add_full_button.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/core/widget/success_message.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_model/rack_item.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/rack_cubit/rack_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditRackForm extends StatelessWidget {
  const EditRackForm({super.key, required this.rack});
  final RackItem rack;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RackCubit>();
    return BlocConsumer<RackCubit, RackState>(
      listener: (context, state) {
        if (state is EditRackSuccess) {
          Navigator.pop(context);
          customShowDialog(
            context,
            widget: SuccessMessage(messageName: 'rack', isEdit: true),
          );
        } else if (state is EditRackFailure) {
          showToast('Failed to edit rack');
        } else if (state is EditRackLoading) {
          CustomLoading();
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formEditRackKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Edit Rack', style: CustomTextStyles.text14W500Primary),
              SizedBox(height: 20.h),
              TitleWithTextField(
                title: 'Rack name',
                value: rack.rackName,
                onChanged: (value) => cubit.editRackNameController.text = value,
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'Site Name',
                value: rack.siteName,
                onChanged: (value) => cubit.editSiteNameController.text = value,
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'Rack Size',
                value: rack.rackSize.toString(),
                onChanged: (value) => cubit.editRackSizeController.text = value,
              ),
              SizedBox(height: 10.h),
              TitleWithTextField(
                title: 'Rack Model',
                value: rack.rackModel,
                onChanged: (value) =>
                    cubit.editRackModelController.text = value,
              ),
              SizedBox(height: 40.h),
              AddFullSizeButton(
                onPressed: () {
                  if (cubit.formEditRackKey.currentState!.validate()) {
                    cubit.editRack(rack: rack);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
