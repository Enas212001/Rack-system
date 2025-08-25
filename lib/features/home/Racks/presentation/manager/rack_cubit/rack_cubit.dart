import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_model/rack_item.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/Racks/data/repo/rack_repo.dart';
import 'package:flutter_application_1/features/home/Racks/data/repo/rack_repo_impl.dart';

part 'rack_state.dart';

class RackCubit extends Cubit<RackState> {
  RackCubit() : super(RackInitial());
  final RackRepo homeRepo = RackRepoImpl(api: getIt.get<DioConsumer>());

  Future<void> getRacksInfo({required String buildingId}) async {
    emit(RacksLoading());
    try {
      final result = await homeRepo.getRacksInfo(buildingId: buildingId);
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

  List<RackItem> filteredRacks = [];
  void searchRack(String query) {
    if (state is! RacksSuccess) return;
    if (query.isEmpty) {
      emit(RacksSuccess(racks: filteredRacks));
      return;
    }
    final filtered = filteredRacks.where((rack) {
      final name = rack.rackName?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();
    emit(RacksSuccess(racks: filtered));
  }

  final GlobalKey<FormState> formAddRackKey = GlobalKey<FormState>();

  List<SwitchItem> selectedSwitchs = [];
  final TextEditingController rackNameController = TextEditingController();
  final TextEditingController rackSizeController = TextEditingController();
  final TextEditingController rackModelController = TextEditingController();
  final TextEditingController siteNameController = TextEditingController();

  Future<void> addRack({required BuildingModel building}) async {
    emit(AddRackLoading());
    try {
      final response = await homeRepo.addRack(
        switchIds: selectedSwitchs.map((dept) => dept.id!.toString()).toList(),
        buildingId: building.id!.toString(),
        rackName: rackNameController.text,
        rackSize: rackSizeController.text,
        siteName: siteNameController.text,
        rackModel: rackModelController.text,
        buildingRId: building.buildingRId?.toString() ?? '',
      );
      response.fold(
        (failure) =>
            emit(AddRackFailure(message: failure.failure.errorMessage)),
        (rack) {
          emit(AddRackSuccess(rack: rack));
          rackNameController.clear();
          rackSizeController.clear();
          rackModelController.clear();
          siteNameController.clear();
          selectedSwitchs = [];
        },
      );
    } catch (e) {
      emit(AddRackFailure(message: e.toString()));
    }
  }

  final GlobalKey<FormState> formEditRackKey = GlobalKey<FormState>();
  List<SwitchItem> editSelectedSwitchs = [];
  final TextEditingController editRackNameController = TextEditingController();
  final TextEditingController editRackSizeController = TextEditingController();
  final TextEditingController editRackModelController = TextEditingController();
  final TextEditingController editSiteNameController = TextEditingController();

  Future<void> editRack({required RackItem rack}) async {
    emit(EditRackLoading());
    try {
      final response = await homeRepo.editRack(
        rackId: rack.id?.toString() ?? '',
        switchIds: editSelectedSwitchs
            .map((dept) => dept.id!.toString())
            .toList(),
        rackName: editRackNameController.text.isEmpty
            ? rack.rackName!
            : editRackNameController.text,
        rackSize: editRackSizeController.text.isEmpty
            ? rack.rackSize.toString()
            : editRackSizeController.text,
        siteName: editSiteNameController.text.isEmpty
            ? rack.siteName!
            : editSiteNameController.text,
        rackModel: editRackModelController.text.isEmpty
            ? rack.rackModel!
            : editRackModelController.text,
        buildingRId: rack.buildingRId?.toString() ?? '',
      );
      response.fold(
        (failure) =>
            emit(EditRackFailure(message: failure.failure.errorMessage)),
        (rack) {
          emit(EditRackSuccess(rack: rack));
          editRackNameController.clear();
          editRackSizeController.clear();
          editRackModelController.clear();
          editSiteNameController.clear();
          editSelectedSwitchs = [];
        },
      );
    } catch (e) {
      emit(EditRackFailure(message: e.toString()));
    }
  }

  Future<void> deleteRack({required RackItem rack}) async {
    emit(DeleteRackLoading());
    try {
      final response = await homeRepo.deleteRack(
        rackId: rack.id?.toString() ?? '',
      );
      response.fold(
        (failure) =>
            emit(DeleteRackFailure(message: failure.failure.errorMessage)),
        (rack) {
          emit(DeleteRackSuccess(rack: rack));
        },
      );
    } catch (e) {
      emit(DeleteRackFailure(message: e.toString()));
    }
  }
}
