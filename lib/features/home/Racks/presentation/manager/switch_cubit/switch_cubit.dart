import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/Racks/data/repo/switch/switch_repo.dart';
import 'package:flutter_application_1/features/home/Racks/data/repo/switch/switch_repo_impl.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchInitial());
  SwitchRepo switchRepo = SwitchRepoImpl(api: getIt.get<DioConsumer>());

  Future<void> getAllSwitchs() async {
    emit(AllSwitchLoading());
    final result = await switchRepo.getAllSwitchs();
    result.fold(
      (failure) =>
          emit(AllSwitchFailure(message: failure.failure.errorMessage)),
      (switchs) => emit(AllSwitchSuccess(switchs: switchs)),
    );
  }

  Future<void> getSwitchs({required String hotelId}) async {
    emit(SwitchLoading());
    final result = await switchRepo.getSwitchs(hotelId: hotelId);
    result.fold(
      (failure) => emit(SwitchFailure(message: failure.failure.errorMessage)),
      (switchs) => emit(SwitchSuccess(switchs: switchs)),
    );
  }

  List<SwitchItem> filteredSwitchs = [];
  void searchSwitch(String query) {
    if (state is! SwitchSuccess) return;
    if (query.isEmpty) {
      emit(SwitchSuccess(switchs: filteredSwitchs));
      return;
    }
    final filtered = filteredSwitchs.where((switchs) {
      final name = switchs.name?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();
    emit(SwitchSuccess(switchs: filtered));
  }

  TextEditingController switchNameController = TextEditingController();
  TextEditingController serialNumberController = TextEditingController();
  TextEditingController macAddController = TextEditingController();
  TextEditingController ipAddController = TextEditingController();
  TextEditingController upLinkCore1Controller = TextEditingController();
  TextEditingController upLinkCore2Controller = TextEditingController();
  TextEditingController portNumberController = TextEditingController();
  TextEditingController switchModelController = TextEditingController();

  Future<void> addSwitch({required String hotelId}) async {
    emit(AddSwitchLoading());
    final result = await switchRepo.addSwitch(
      switchName: switchNameController.text,
      serialNumber: serialNumberController.text,
      macAdd: macAddController.text,
      ipAdd: ipAddController.text,
      upLinkCore1: upLinkCore1Controller.text,
      upLinkCore2: upLinkCore2Controller.text,
      portNumber: portNumberController.text,
      switchModel: switchModelController.text,
      hotelId: hotelId,
    );
    result.fold(
      (failure) =>
          emit(AddSwitchFailure(message: failure.failure.errorMessage)),
      (switchs) => emit(AddSwitchSuccess(switchs: switchs)),
    );
  }
}
