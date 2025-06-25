import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/home/Racks/models/rack_info_model.dart';
import 'package:flutter_application_1/features/home/data/repo/home_repo.dart';
import 'package:flutter_application_1/features/home/data/repo/home_repo_impl.dart';

part 'rack_state.dart';

class RackCubit extends Cubit<RackState> {
  RackCubit() : super(RackInitial());
  final HomeRepo homeRepo = HomeRepoImpl(api: getIt.get<DioConsumer>());

  final GlobalKey<FormState> formAddRackKey = GlobalKey<FormState>();

  final TextEditingController productPanelController = TextEditingController();
  final TextEditingController productSerialController = TextEditingController();
  final TextEditingController productMacController = TextEditingController();
  final TextEditingController productModelController = TextEditingController();
  final TextEditingController productPortController = TextEditingController();
  final TextEditingController deviceNameController = TextEditingController();
  final TextEditingController siteNameController = TextEditingController();

  String? selectedBuildingId;
  String? selectedSwitchId;

  List<String> buildingRackIds = ['R_u14', 'R_u13'];
  List<String> switchIds = ['1', '2', '3'];

  Future<void> getRacksInfo({required String buildingRId}) async {
    emit(RacksLoading());
    try {
      final result = await homeRepo.getRacksInfo(buildingRId: buildingRId);
      result.fold(
        (failure) => emit(RacksFailure(message: failure.failure.errorMessage)),
        (racks) => emit(RacksSuccess(racks: racks)),
      );
    } catch (e) {
      emit(RacksFailure(message: e.toString()));
    }
  }

  Future<void> addRack() async {
    emit(AddRackLoading());
    try {
      final response = await homeRepo.addRack(
        buildingRId: selectedBuildingId!,
        switchId: selectedSwitchId!,
        productPanel: productPanelController.text,
        productSerial: productSerialController.text,
        productMac: productMacController.text,
        productModel: productModelController.text,
        productPort: productPortController.text,
        deviceName: deviceNameController.text,
        siteName: siteNameController.text,
      );
      response.fold(
        (failure) =>
            emit(AddRackFailure(message: failure.failure.errorMessage)),
        (rack) {
          emit(AddRackSuccess(rack: rack));
          productPanelController.clear();
          productSerialController.clear();
          productMacController.clear();
          productModelController.clear();
          productPortController.clear();
          deviceNameController.clear();
          siteNameController.clear();
          selectedSwitchId = null;
          selectedBuildingId = null;
        },
      );
    } catch (e) {
      emit(AddRackFailure(message: e.toString()));
    }
  }
}
