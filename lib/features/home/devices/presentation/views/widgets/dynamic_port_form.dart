import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_show_dialog.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/widget/add_full_button.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/core/widget/success_message.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'port_data_entry.dart';

class DynamicPortForm extends StatelessWidget {
  final int switchId;
  final int portCount;

  const DynamicPortForm({
    super.key,
    required this.switchId,
    required this.portCount,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DeviceCubit>();
    if (!cubit.isInitializedForSwitch(switchId)) {
      cubit.initPorts(switchId, portCount);
    }

    return BlocConsumer<DeviceCubit, DeviceState>(
      listener: (context, state) {
        if (state is DeviceAddSuccess) {
          Navigator.pop(context);
          customShowDialog(
            context,
            widget: SuccessMessage(messageName: 'device'),
          );
        } else if (state is DeviceAddFailure) {
          showToast(state.failure);
        }
      },
      builder: (context, state) {
        if (state is DeviceAddLoading) {
          return const CustomLoading();
        }
        if (state is DeviceFormUpdated) {
          return Column(
            children: [
              ...state.portData.asMap().entries.map((entry) {
                final index = entry.key;
                final port = entry.value;
                return PortDataEntry(
                  portNumber: index + 1,
                  port: port,
                  onChanged: (key, value) {
                    cubit.updatePortField(switchId, index, key, value);
                  },
                );
              }),
              AddFullSizeButton(
                onPressed: () => cubit.addDevice(switchId),
                text: 'Save',
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
