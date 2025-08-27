import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
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

  List<Map<String, String>> _currentPorts = [];

  void initPorts(int switchId, int count) {
    _currentPorts = List.generate(
      count,
      (_) => {
        'name': '',
        'serial': '',
        'mac': '',
        'ip': '',
        'patch': '',
        'product': '',
        'model': '',
      },
    );
    emit(DeviceFormUpdated(switchId: switchId, portData: _currentPorts));
  }

  void updatePortField(int index, String key, String value) {
    _currentPorts[index][key] = value;
    emit(
      DeviceFormUpdated(
        switchId: state is DeviceFormUpdated
            ? (state as DeviceFormUpdated).switchId
            : 0,
        portData: List.from(_currentPorts),
      ),
    );
  }

  Future<void> addDevice(int switchId) async {
    emit(DeviceAddLoading());
    try {
      final devices = _currentPorts.asMap().entries.map((entry) {
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

      // call repository (simulate)
      await Future.delayed(const Duration(seconds: 1));
      deviceRepo.addDevice(switchId: switchId, devices: devices);

      emit(DeviceAddSuccess(device: devices));
    } catch (e) {
      emit(DeviceAddFailure(failure: e.toString()));
    }
  }
}
