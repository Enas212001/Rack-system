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
      (devices) => emit(DeviceSuccess(devices: devices)),
    );
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

  Future<void> addDevice({required int switchId, required List<Device> devices}) async {
    emit(DeviceAddLoading());
    final result = await deviceRepo.addDevice(switchId: switchId, devices: devices);
    result.fold(
      (failure) => emit(DeviceAddFailure(failure: failure.failure.errorMessage)),
      (device) => emit(DeviceAddSuccess(device: device)),
    );
  }
}
