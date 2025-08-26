import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/features/guest_flow/data/repo/summary_repo.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/summary_model/summary_item.dart';

part 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  SummaryCubit() : super(SummaryInitial());
  final SummaryRepo summaryRepo = SummaryRepoImpl(
    apiConsumer: getIt.get<DioConsumer>(),
  );

  Future<void> getSummary({required String switchId}) async {
    emit(SummaryLoading());
    final result = await summaryRepo.getSummary(switchId: switchId);
    result.fold(
      (failure) => emit(SummaryFailure(message: failure.failure.errorMessage)),
      (summaries) => emit(SummarySuccess(summaries: summaries)),
    );
  }
}
