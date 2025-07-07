import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/home/Racks/data/repo/rack_repo.dart';
import 'package:flutter_application_1/features/home/Racks/data/repo/rack_repo_impl.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_info_model.dart';

part 'rack_state.dart';

class RackCubit extends Cubit<RackState> {
  RackCubit() : super(RackInitial());
  final RackRepo homeRepo = RackRepoImpl(api: getIt.get<DioConsumer>());

  final GlobalKey<FormState> formAddRackKey = GlobalKey<FormState>();

  final TextEditingController productPanelController = TextEditingController();
  final TextEditingController productSerialController = TextEditingController();
  final TextEditingController productMacController = TextEditingController();
  final TextEditingController productModelController = TextEditingController();
  final TextEditingController productPortController = TextEditingController();
  final TextEditingController deviceNameController = TextEditingController();
  final TextEditingController siteNameController = TextEditingController();

  String? selectedSwitchId;

  List<String> switchIds = ['1', '2', '3'];

  Future<void> getRacksInfo({required String buildingRId}) async {
    emit(RacksLoading());
    try {
      final result = await homeRepo.getRacksInfo(buildingRId: buildingRId);
      result.fold(
        (failure) => emit(RacksFailure(message: failure.failure.errorMessage)),
        (racks) {
          filteredRacks = racks;
          emit(RacksSuccess(racks: racks));
        },
      );
    } catch (e) {
      emit(RacksFailure(message: e.toString()));
    }
  }

  List<RackInfoModel> filteredRacks = [];
  void searchRack(String query) {
    if (state is! RacksSuccess) return;
    if (query.isEmpty) {
      emit(RacksSuccess(racks: filteredRacks));
      return;
    }
    final filtered = filteredRacks.where((hotel) {
      final name = hotel.deviceName?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();
    emit(RacksSuccess(racks: filtered));
  }

  Future<void> addRack({required String buildingRId}) async {
    emit(AddRackLoading());
    try {
      final response = await homeRepo.addRack(
        switchId: selectedSwitchId!,
        productPanel: productPanelController.text,
        productSerial: productSerialController.text,
        productMac: productMacController.text,
        productModel: productModelController.text,
        productPort: productPortController.text,
        deviceName: deviceNameController.text,
        siteName: siteNameController.text,
        buildingRId: buildingRId,
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
        },
      );
    } catch (e) {
      emit(AddRackFailure(message: e.toString()));
    }
  }
}
