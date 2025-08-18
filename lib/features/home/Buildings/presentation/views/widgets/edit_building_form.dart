import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/widget/add_full_button.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditBuildingForm extends StatelessWidget {
  const EditBuildingForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Edit Building', style: CustomTextStyles.text14W500Primary),
            SizedBox(height: 20.h),
            TitleWithTextField(
              title: 'Building Name',
              controller: TextEditingController(),
              hintText: 'Enter Building Name',
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Rack ID',
              controller: TextEditingController(),
              hintText: 'Enter your Rack ID',
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Building Rack ID',
              controller: TextEditingController(),
              hintText: 'Enter Building Rack ID',
            ),
            SizedBox(height: 60.h),
            AddFullSizeButton(onPressed: () {}, text: 'Submit'),
          ],
        ),
      ),
    );
  }
}
