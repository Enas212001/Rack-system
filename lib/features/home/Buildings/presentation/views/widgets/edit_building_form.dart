import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_show_dialog.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/widget/custom_loading.dart';
import 'package:flutter_application_1/core/utils/widget/success_message.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/core/utils/widget/add_full_button.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/cubit/building_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditBuildingForm extends StatelessWidget {
  const EditBuildingForm({super.key, required this.building});
  final BuildingModel building;
  @override
  Widget build(BuildContext context) {
    final buildingCubit = BlocProvider.of<BuildingCubit>(context);
    return BlocConsumer<BuildingCubit, BuildingState>(
      listener: (context, state) {
        if (state is EditBuildingSuccess) {
          Navigator.pop(context);
          customShowDialog(
            context,
            widget: SuccessMessage(messageName: 'Building'),
          );
        } else if (state is EditBuildingFailure) {
          showToast('Failed to edit building');
        } else if (state is EditBuildingLoading) {
          CustomLoading();
        }
      },
      builder: (context, state) {
        return Form(
          key: buildingCubit.formEditBuildingKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Edit Building',
                  style: CustomTextStyles.text14W500Primary,
                ),
                SizedBox(height: 20.h),
                TitleWithTextField(
                  title: 'Building Name',
                  onChanged: (value) =>
                      buildingCubit.editBuildingNameController.text = value,
                  value: building.buildingName!,
                ),
                SizedBox(height: 60.h),
                AddFullSizeButton(
                  onPressed: () {
                    if (buildingCubit.formEditBuildingKey.currentState!
                        .validate()) {
                      buildingCubit.editBuilding(building: building);
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
