import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/home/data/models/building_model/building_model.dart';
import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';
import 'package:flutter_application_1/features/home/data/models/rack_info_model/rack_info_model.dart';
import 'package:flutter_application_1/features/home/data/repo/home_repo.dart';
import 'package:flutter_application_1/features/home/data/repo/home_repo_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final HomeRepo homeRepo = HomeRepoImpl(api: getIt.get<DioConsumer>());

  Future<void> getHotels() async {
    emit(HotelLoading());
    try {
      final buildings = await homeRepo.getHotels();
      buildings.fold(
        (failure) => emit(HotelFailure(message: failure.failure.errorMessage)),
        (buildings) => emit(HotelSuccess(buildings: buildings)),
      );
    } catch (e) {
      emit(HotelFailure(message: e.toString()));
    }
  }

  Future<void> getBuildings() async {
    emit(BuildingLoading());
    try {
      final buildings = await homeRepo.getBuildings();
      buildings.fold(
        (failure) =>
            emit(BuildingFailure(message: failure.failure.errorMessage)),
        (buildings) => emit(BuildingSuccess(buildings: buildings)),
      );
    } catch (e) {
      emit(BuildingFailure(message: e.toString()));
    }
  }
  Future<void> getRacksInfo() async {
    emit(RacksLoading());
    try {
      final racks = await homeRepo.getRacksInfo();
      racks.fold(
        (failure) => emit(
          RacksFailure(message: failure.failure.errorMessage),
        ),
        (racks) => emit(RacksSuccess(racks: racks)),
      );
    } catch (e) {
      emit(RacksFailure(message: e.toString()));
    }
  }
}
