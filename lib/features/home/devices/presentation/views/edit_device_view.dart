import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/add_form_widget.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/edit_device_form.dart';

class EditDeviceView extends StatelessWidget {
  const EditDeviceView({super.key, required this.deviceItem});
  final DeviceItem deviceItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context) => DeviceCubit(),
        child: AddFormWidget(
          title: 'Device',
          childWidget: EditDeviceForm(deviceItem: deviceItem),
          isEdit: true,
        ),
      ),
    );
  }
}
