import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';
import 'package:flutter_application_1/features/home/data/repo/home_repo.dart';
import 'package:flutter_application_1/features/home/data/repo/home_repo_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final HomeRepo homeRepo = HomeRepoImpl(api: getIt.get<DioConsumer>());

  Future<void> getBuildings() async {
    emit(HomeLoading());
    try {
      final buildings = await homeRepo.getBuildings();
      emit(HomeSuccess(buildings: buildings));
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }
}
