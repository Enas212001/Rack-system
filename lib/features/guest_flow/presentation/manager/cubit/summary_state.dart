part of 'summary_cubit.dart';

sealed class SummaryState extends Equatable {
  const SummaryState();

  @override
  List<Object> get props => [];
}

final class SummaryInitial extends SummaryState {}

final class SummaryLoading extends SummaryState {}

final class SummarySuccess extends SummaryState {
  final List<SummaryItem> summaries;
  const SummarySuccess({required this.summaries});
}

final class SummaryFailure extends SummaryState {
  final String message;
  const SummaryFailure({required this.message});
}
