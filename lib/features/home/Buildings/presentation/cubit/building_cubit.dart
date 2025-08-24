import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Buildings/data/repo/building_repo.dart';
import 'package:flutter_application_1/features/home/Buildings/data/repo/building_repo_impl.dart';

part 'building_state.dart';

class BuildingCubit extends Cubit<BuildingState> {
  BuildingCubit() : super(BuildingInitial());
  final BuildingRepo buildingRepo = BuildingRepoImpl(
    api: getIt.get<DioConsumer>(),
  );

  final GlobalKey<FormState> formAddBuildingKey = GlobalKey<FormState>();
  final TextEditingController rackIdController = TextEditingController();
  final TextEditingController buildingRackIdController =
      TextEditingController();
  final TextEditingController buildingNameController = TextEditingController();

  Future<void> getBuildings({required String hotelId}) async {
    emit(BuildingLoading());
    try {
      final buildings = await buildingRepo.getBuildings(hotelId: hotelId);
      buildings.fold(
        (failure) =>
            emit(BuildingFailure(message: failure.failure.errorMessage)),
        (buildings) {
          buildingsList = buildings;
          emit(BuildingSuccess(buildings: buildings));
        },
      );
    } catch (e) {
      emit(BuildingFailure(message: e.toString()));
    }
  }

  List<BuildingModel> buildingsList = [];
  void searchBuildings(String query) {
    if (state is! BuildingSuccess) return;

    if (query.isEmpty) {
      emit(BuildingSuccess(buildings: buildingsList));
      return;
    }

    final filtered = buildingsList.where((building) {
      final name = building.buildingName?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();

    emit(BuildingSuccess(buildings: filtered));
  }

  Future<void> addBuilding({required String hotelId}) async {
    emit(AddBuildingLoading());
    try {
      final response = await buildingRepo.addBuilding(
        buildingName: buildingNameController.text,
        rackId: rackIdController.text,
        buildingRackId: buildingRackIdController.text,
        hotelId: hotelId,
      );
      response.fold(
        (failure) =>
            emit(AddBuildingFailure(message: failure.failure.errorMessage)),
        (building) {
          emit(AddBuildingSuccess(building: building));
          buildingNameController.clear();
          rackIdController.clear();
          buildingRackIdController.clear();
        },
      );
    } catch (e) {
      emit(AddBuildingFailure(message: e.toString()));
    }
  }

  final GlobalKey<FormState> formEditBuildingKey = GlobalKey<FormState>();
  final TextEditingController editRackIdController = TextEditingController();
  final TextEditingController editBuildingRackIdController =
      TextEditingController();
  final TextEditingController editBuildingNameController =
      TextEditingController();
  Future<void> editBuilding({required BuildingModel building}) async {
    emit(EditBuildingLoading());
    try {
      final response = await buildingRepo.editBuilding(
        buildingId: building.id!,
        buildingName: editBuildingNameController.text.isEmpty
            ? building.buildingName!
            : editBuildingNameController.text,
        rackId: editRackIdController.text.isEmpty
            ? building.rackId!
            : editRackIdController.text,
        buildingRackId: editBuildingRackIdController.text.isEmpty
            ? building.buildingRId!
            : editBuildingRackIdController.text,
      );
      response.fold(
        (failure) =>
            emit(EditBuildingFailure(message: failure.failure.errorMessage)),
        (building) {
          emit(EditBuildingSuccess(building: building));
          editBuildingNameController.clear();
          editRackIdController.clear();
          editBuildingRackIdController.clear();
        },
      );
    } catch (e) {
      emit(EditBuildingFailure(message: e.toString()));
    }
  }

  Future<void> deleteBuilding({required String buildingId}) async {
    emit(DeleteBuildingLoading());
    try {
      final response = await buildingRepo.deleteBuilding(
        buildingId: buildingId,
      );
      response.fold(
        (failure) =>
            emit(DeleteBuildingFailure(message: failure.failure.errorMessage)),
        (building) {
          emit(DeleteBuildingSuccess(building: building));
        },
      );
    } catch (e) {
      emit(DeleteBuildingFailure(message: e.toString()));
    }
  }
}
