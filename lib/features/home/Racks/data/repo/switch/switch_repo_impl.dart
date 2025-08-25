import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api/api_consumer.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';

import 'switch_repo.dart';

class SwitchRepoImpl implements SwitchRepo {
  final ApiConsumer api;
  SwitchRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, SwitchItem>> addSwitch({
    required String switchName,
    required String serialNumber,
    required String macAdd,
    required String ipAdd,
    required String upLinkCore1,
    required String upLinkCore2,
    required String portNumber,
    required String switchModel,
    required String hotelId,
  }) async {
    try {
      final response = await api.post(
        Endpoints.addSwitch(hotelId),
        data: {
          ApiKey.name: switchName,
          ApiKey.serialNumber: serialNumber,
          ApiKey.macAdd: macAdd,
          ApiKey.ipAdd: ipAdd,
          ApiKey.upLinkCore1: upLinkCore1,
          ApiKey.upLinkCore2: upLinkCore2,
          ApiKey.portNumber: portNumber,
          ApiKey.model: switchModel,
          ApiKey.hotelId: hotelId,
        },
      );
      final switchItem = SwitchItem.fromJson(response['data']);
      return right(switchItem);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, List<SwitchItem>>> getAllSwitchs() async {
    try {
      final response = await api.get(Endpoints.getAllSwitchs);
      final switchs = (response['data'] as List)
          .map<SwitchItem>((e) => SwitchItem.fromJson(e))
          .toList();
      return right(switchs);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, List<SwitchItem>>> getSwitchs({
    required String hotelId,
  }) async {
    try {
      final response = await api.get(Endpoints.getSwitchs(hotelId));
      final switchs = (response['data'] as List)
          .map<SwitchItem>((e) => SwitchItem.fromJson(e))
          .toList();
      return right(switchs);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }
}
