import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_show_dialog.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/widget/add_full_button.dart';
import 'package:flutter_application_1/core/widget/success_message.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/widgets/switch_drop_down.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditDeviceForm extends StatelessWidget {
  const EditDeviceForm({super.key, required this.deviceItem});
  final DeviceItem deviceItem;

  @override
  Widget build(BuildContext context) {
    final deviceCubit = context.read<DeviceCubit>();
    return BlocConsumer<DeviceCubit, DeviceState>(
      listener: (context, state) {
        if (state is DeviceEditSuccess) {
          Navigator.pop(context);
          customShowDialog(
            context,
            widget: SuccessMessage(messageName: 'device', isEdit: true),
          );
        } else if (state is DeviceEditFailure) {
          showToast(state.failure);
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Edit Device', style: CustomTextStyles.text14W500Primary),
            SizedBox(height: 20.h),
            SwitchDropDown(
              value: deviceCubit.switchItem,
              onChanged: (switchItem) {
                deviceCubit.switchItem = switchItem;
              },
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Port Number',
              value: deviceItem.portNumber.toString(),
              onChanged: (value) => deviceCubit.portController.text = value,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Device Name',
              value: deviceItem.deviceName,
              onChanged: (value) =>
                  deviceCubit.deviceNameController.text = value,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Device Serial',
              value: deviceItem.deviceSerial,
              onChanged: (value) =>
                  deviceCubit.deviceSerialController.text = value,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'MAC Address',
              value: deviceItem.macAddress,
              onChanged: (value) =>
                  deviceCubit.macAddressController.text = value,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Device IP',
              value: deviceItem.ipAddress,
              onChanged: (value) =>
                  deviceCubit.ipAddressController.text = value,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Patch Panel',
              value: deviceItem.patchPanel,
              onChanged: (value) =>
                  deviceCubit.patchPanelController.text = value,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Product Number',
              value: deviceItem.productNumber,
              onChanged: (value) =>
                  deviceCubit.productNumberController.text = value,
            ),
            SizedBox(height: 10.h),
            TitleWithTextField(
              title: 'Device Model',
              value: deviceItem.deviceModel,
              onChanged: (value) =>
                  deviceCubit.deviceModelController.text = value,
            ),
            SizedBox(height: 40.h),
            AddFullSizeButton(
              onPressed: () {
                deviceCubit.editDevice(device: deviceItem);
              },
            ),
          ],
        );
      },
    );
  }
}
