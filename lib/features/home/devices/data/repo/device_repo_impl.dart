import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api/api_consumer.dart';

import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/features/home/devices/data/models/add_device_request.dart';

import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';

import 'device_repo.dart';

class DeviceRepoImpl extends DeviceRepo {
  final ApiConsumer apiConsumer;
  DeviceRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ServerFailure, List<DeviceItem>>> addDevice({
    required int switchId,
    required List<Device> devices,
  }) async {
    try {
      final response = await apiConsumer.post(
        Endpoints.addDevice,
        data: {
          ApiKey.switchId: switchId,
          ApiKey.devices: devices.map((device) => device.toJson()).toList(),
        },
      );
      if (response['message'] == 'success') {
        return right(
          (response['data'] as List<dynamic>)
              .map((item) => DeviceItem.fromJson(item as Map<String, dynamic>))
              .toList(),
        );
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: 'false',
              errorMessage: response['message'] ?? 'Failed to add devices',
            ),
          ),
        );
      }
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, String>> deleteDevice({
    required String deviceId,
  }) async {
    try {
      final response = await apiConsumer.delete(
        Endpoints.deleteDevice(deviceId),
      );
      if (response.statusCode == 200) {
        return right(response['message']);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: 'false',
              errorMessage: response['message'],
            ),
          ),
        );
      }
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
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
  }) {
    // TODO: implement editDevice
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailure, List<DeviceItem>>> getDevices({
    required String switchId,
  }) async {
    try {
      final response = await apiConsumer.get(Endpoints.getDevices(switchId));
      if (response['status'] == 'success') {
        return right(
          (response['data'] as List<dynamic>)
              .map((item) => DeviceItem.fromJson(item as Map<String, dynamic>))
              .toList(),
        );
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: 'false',
              errorMessage: 'Failed to get devices',
            ),
          ),
        );
      }
    } on ServerFailure catch (e) {
      return left(e);
    }
  }
}
