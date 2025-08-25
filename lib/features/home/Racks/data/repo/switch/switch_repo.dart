import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/server_failure.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/summary_model/summary_model.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';

abstract class SwitchRepo {
  Future<Either<ServerFailure, List<SwitchItem>>> getAllSwitchs();
  Future<Either<ServerFailure, List<SwitchItem>>> getSwitchs({
    required String hotelId,
  });
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
  });
  Future<Either<ServerFailure, SummaryModel>> addSummary({
    required String switchId,
    required String apRoom,
    required String apOut,
    required String cctvIn,
    required String cctvOut,
  });
}
