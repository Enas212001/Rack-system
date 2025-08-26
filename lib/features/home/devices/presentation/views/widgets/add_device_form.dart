import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/widgets/switch_drop_down.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dynamic_port_form.dart';

class AddDeviceForm extends StatefulWidget {
  const AddDeviceForm({super.key});

  @override
  State<AddDeviceForm> createState() => _AddDeviceFormState();
}

class _AddDeviceFormState extends State<AddDeviceForm> {
  SwitchItem? selectedSwitch;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Add Device', style: CustomTextStyles.text14W500Primary),
        SizedBox(height: 20.h),

        // First step: select switch
        SwitchDropDown(
          value: selectedSwitch,
          onChanged: (switchItem) {
            setState(() {
              selectedSwitch = switchItem;
            });
          },
        ),

        SizedBox(height: 20.h),

        // If a switch is selected, show its ports
        if (selectedSwitch != null)
          DynamicPortForm(
            switchId: selectedSwitch!.id!,
            portCount: selectedSwitch!.portNumber ?? 0,
          ),
      ],
    );
  }
}
