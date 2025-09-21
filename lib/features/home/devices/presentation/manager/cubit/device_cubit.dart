import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/service/service_locator.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/devices/data/models/add_device_request.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';
import 'package:flutter_application_1/features/home/devices/data/repo/device_repo.dart';
import 'package:flutter_application_1/features/home/devices/data/repo/device_repo_impl.dart';

part 'device_state.dart';

class DeviceCubit extends Cubit<DeviceState> {
  DeviceCubit() : super(DeviceInitial());
  final DeviceRepo deviceRepo = DeviceRepoImpl(
    apiConsumer: getIt.get<DioConsumer>(),
  );
  Future<void> getDevices({required String switchId}) async {
    emit(DeviceLoading());
    final result = await deviceRepo.getDevices(switchId: switchId);
    result.fold(
      (failure) => emit(DeviceFailure(failure: failure.failure.errorMessage)),
      (devices) {
        devicesList = devices;
        emit(DeviceSuccess(devices: devices));
      },
    );
  }

  List<DeviceItem> devicesList = [];
  void searchDevices(String query) {
    if (state is! DeviceSuccess) return;

    if (query.isEmpty) {
      emit(DeviceSuccess(devices: devicesList));
      return;
    }

    final filtered = devicesList.where((device) {
      final name = device.deviceName?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();

    emit(DeviceSuccess(devices: filtered));
  }

  Future<void> deleteDevice({required String deviceId}) async {
    emit(DeviceDeleteLoading());
    final result = await deviceRepo.deleteDevice(deviceId: deviceId);
    result.fold(
      (failure) =>
          emit(DeviceDeleteFailure(failure: failure.failure.errorMessage)),
      (message) => emit(DeviceDeleteSuccess(message: message)),
    );
  }

  Map<int, List<Map<String, String>>> switchPortData = {};

  bool isInitializedForSwitch(int switchId) {
    return switchPortData.containsKey(switchId);
  }

  void initPorts(int switchId, int portCount) {
    if (!switchPortData.containsKey(switchId)) {
      // If switch is new, copy from last selected switch if exists
      if (switchPortData.isNotEmpty) {
        final lastSwitchId = switchPortData.keys.last;
        final lastPorts = switchPortData[lastSwitchId]!;

        // Copy values, but only into empty fields
        switchPortData[switchId] = List.generate(
          portCount,
          (index) => Map.from(lastPorts[index]),
        );
      } else {
        // Fresh init
        switchPortData[switchId] = List.generate(
          portCount,
          (index) => {
            'name': '',
            'serial': '',
            'mac': '',
            'ip': '',
            'patch': '',
            'product': '',
            'model': '',
          },
        );
      }
    }

    emit(
      DeviceFormUpdated(
        switchId: switchId,
        portData: switchPortData[switchId]!,
      ),
    );
  }

  void updatePortField(int switchId, int index, String key, String value) {
    final ports = switchPortData[switchId];
    if (ports != null) {
      ports[index][key] = value;
      emit(DeviceFormUpdated(portData: ports, switchId: switchId));
    }
  }

  Future<void> addDevice(int switchId) async {
    emit(DeviceAddLoading());
    try {
      final devices = switchPortData[switchId]!.asMap().entries.map((entry) {
        final i = entry.key;
        final data = entry.value;
        return Device(
          portNumber: i + 1,
          deviceName: data['name'] ?? '',
          deviceSerial: data['serial'] ?? '',
          macAddress: data['mac'] ?? '',
          ipAddress: data['ip'] ?? '',
          patchPanel: data['patch'] ?? '',
          productNumber: data['product'] ?? '',
          deviceModel: data['model'] ?? '',
        );
      }).toList();
      final result = await deviceRepo.addDevice(
        switchId: switchId,
        devices: devices,
      );

      // Handle the result properly
      return result.fold(
        (failure) =>
            emit(DeviceAddFailure(failure: failure.failure.errorMessage)),
        (updatedDevices) async {
          // After successful add, fetch the latest devices
          final devicesResult = await deviceRepo.getDevices(
            switchId: switchId.toString(),
          );
          devicesResult.fold(
            (failure) =>
                emit(DeviceAddFailure(failure: failure.failure.errorMessage)),
            (devicesList) {
              emit(DeviceAddSuccess(device: devicesList));
            },
          );
        },
      );
    } catch (e) {
      emit(DeviceAddFailure(failure: e.toString()));
    }
  }

  TextEditingController deviceNameController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController deviceSerialController = TextEditingController();
  TextEditingController macAddressController = TextEditingController();
  TextEditingController ipAddressController = TextEditingController();
  TextEditingController patchPanelController = TextEditingController();
  TextEditingController productNumberController = TextEditingController();
  TextEditingController deviceModelController = TextEditingController();
  SwitchItem? switchItem;

  Future<void> editDevice({required DeviceItem device}) async {
    emit(DeviceEditLoading());
    final result = await deviceRepo.editDevice(
      deviceId: device.id.toString(),
      switchId: switchItem?.id ?? device.switchId!,
      portNumber: portController.text.isEmpty
          ? device.portNumber.toString()
          : portController.text,
      deviceName: deviceNameController.text.isEmpty
          ? device.deviceName.toString()
          : deviceNameController.text,
      deviceSerial: deviceSerialController.text.isEmpty
          ? device.deviceSerial.toString()
          : deviceSerialController.text,
      macAddress: macAddressController.text.isEmpty
          ? device.macAddress.toString()
          : macAddressController.text,
      ipAddress: ipAddressController.text.isEmpty
          ? device.ipAddress.toString()
          : ipAddressController.text,
      patchPanel: patchPanelController.text.isEmpty
          ? device.patchPanel.toString()
          : patchPanelController.text,
      productNumber: productNumberController.text.isEmpty
          ? device.productNumber.toString()
          : productNumberController.text,
      deviceModel: deviceModelController.text.isEmpty
          ? device.deviceModel.toString()
          : deviceModelController.text,
    );
    result.fold(
      (failure) =>
          emit(DeviceEditFailure(failure: failure.failure.errorMessage)),
      (device) => emit(DeviceEditSuccess(device: device)),
    );
  }
}
