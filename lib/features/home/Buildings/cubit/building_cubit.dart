import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/home/Buildings/models/building_model.dart';
import 'package:flutter_application_1/features/home/data/repo/home_repo.dart';
import 'package:flutter_application_1/features/home/data/repo/home_repo_impl.dart';

part 'building_state.dart';

class BuildingCubit extends Cubit<BuildingState> {
  BuildingCubit() : super(BuildingInitial());
  final HomeRepo homeRepo = HomeRepoImpl(api: getIt.get<DioConsumer>());

  final GlobalKey<FormState> formAddBuildingKey = GlobalKey<FormState>();
  final TextEditingController rackIdController = TextEditingController();
  final TextEditingController buildingRackIdController =
      TextEditingController();
  final TextEditingController buildingNameController = TextEditingController();

  Future<void> getBuildings({required String hotelId}) async {
    emit(BuildingLoading());
    try {
      final buildings = await homeRepo.getBuildings(hotelId: hotelId);
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
      final response = await homeRepo.addBuilding(
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
}
