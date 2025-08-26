import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/features/home/devices/data/models/add_device_request.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';

abstract class DeviceRepo {
  Future<Either<ServerFailure, List<DeviceItem>>> addDevice({
    required int switchId,
    required List<Device> devices
  });
  Future<Either<ServerFailure, DeviceItem>> editDevice({
    required String deviceId,
    required String portNumber,
    required String deviceName,
    required String deviceSerial,
    required String macAddress,
    required String ipAddress,
    required String patchPanel,
    required String productNumber,
    required String deviceModel,
  });
  Future<Either<ServerFailure, String>> deleteDevice({
    required String deviceId,
  });
  Future<Either<ServerFailure, List<DeviceItem>>> getDevices({
    required String switchId,
  });
}
