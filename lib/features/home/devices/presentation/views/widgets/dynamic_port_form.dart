import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_show_dialog.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/widget/add_full_button.dart';
import 'package:flutter_application_1/core/utils/widget/custom_loading.dart';
import 'package:flutter_application_1/core/utils/widget/success_message.dart';
import 'package:flutter_application_1/features/home/devices/data/models/add_device_request.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'port_data_entry.dart';

class DynamicPortForm extends StatefulWidget {
  final int switchId;
  final int portCount;

  const DynamicPortForm({
    super.key,
    required this.switchId,
    required this.portCount,
  });

  @override
  State<DynamicPortForm> createState() => _DynamicPortFormState();
}

class _DynamicPortFormState extends State<DynamicPortForm> {
  List<Map<String, TextEditingController>> portControllers = [];

  @override
  void initState() {
    super.initState();
    _buildControllers();
  }

  @override
  void didUpdateWidget(covariant DynamicPortForm oldWidget) {
    super.didUpdateWidget(oldWidget);

    // if switch changed or port count changed, rebuild controllers
    if (oldWidget.switchId != widget.switchId ||
        oldWidget.portCount != widget.portCount) {
      _disposeControllers();
      _buildControllers();
    }
  }

  void _buildControllers() {
    portControllers = List.generate(widget.portCount, (_) {
      return {
        'name': TextEditingController(),
        'serial': TextEditingController(),
        'mac': TextEditingController(),
        'ip': TextEditingController(),
        'patch': TextEditingController(),
        'product': TextEditingController(),
        'model': TextEditingController(),
      };
    });
    setState(() {});
  }

  void _disposeControllers() {
    for (var map in portControllers) {
      for (var controller in map.values) {
        controller.dispose();
      }
    }
    portControllers.clear();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _onSave() {
    final cubit = context.read<DeviceCubit>();
    final devices = <Device>[];

    for (int i = 0; i < portControllers.length; i++) {
      final c = portControllers[i];
      devices.add(
        Device(
          portNumber: i + 1,
          deviceName: c['name']!.text,
          deviceSerial: c['serial']!.text,
          macAddress: c['mac']!.text,
          ipAddress: c['ip']!.text,
          patchPanel: c['patch']!.text,
          productNumber: c['product']!.text,
          deviceModel: c['model']!.text,
        ),
      );
    }

    cubit.addDevice(switchId: widget.switchId, devices: devices);
  }

  @override
  Widget build(BuildContext context) {
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
          log(state.failure);
        } else if (state is DeviceAddLoading) {
          CustomLoading();
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            ...portControllers.asMap().entries.map(
              (entry) => PortDataEntry(
                portNumber: entry.key + 1,
                controllers: entry.value,
              ),
            ),
            AddFullSizeButton(onPressed: _onSave, text: 'Save'),
          ],
        );
      },
    );
  }
}
