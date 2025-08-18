import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_full_button.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditRackForm extends StatelessWidget {
  const EditRackForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Edit Rack', style: CustomTextStyles.text14W500Primary),
          SizedBox(height: 20.h),
          // DropdownButtonFormField<String>(
          //   value: rackCubit.selectedSwitchId,
          //   decoration: InputDecoration(
          //     labelText: 'Switch ID',
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     labelStyle: CustomTextStyles.text12RegularGrey,
          //   ),
          //   items: rackCubit.switchIds.map((id) {
          //     return DropdownMenuItem(value: id, child: Text(id));
          //   }).toList(),
          //   onChanged: (value) {
          //     rackCubit.selectedSwitchId = value;
          //   },
          //   validator: (value) => value == null ? 'Required' : null,
          // ),
          // SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Rack name',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Site Name',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Rack Size',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Rack Model',
            controller: TextEditingController(),
          ),
          SizedBox(height: 10.h),
          TitleWithTextField(
            title: 'Switches',
            controller: TextEditingController(),
          ),
          SizedBox(height: 40.h),
          AddFullSizeButton(
            onPressed: () {
            },
            text: 'Save',
          ),
        ],
      ),
    );
  }
}