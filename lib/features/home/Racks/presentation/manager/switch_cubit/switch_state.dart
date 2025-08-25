part of 'switch_cubit.dart';

sealed class SwitchState extends Equatable {
  const SwitchState();

  @override
  List<Object> get props => [];
}

final class SwitchInitial extends SwitchState {}

final class SwitchLoading extends SwitchState {}

final class SwitchSuccess extends SwitchState {
  final List<SwitchItem> switchs;
  const SwitchSuccess({required this.switchs});
}

final class SwitchFailure extends SwitchState {
  final String message;
  const SwitchFailure({required this.message});
}

final class AllSwitchLoading extends SwitchState {}

final class AllSwitchSuccess extends SwitchState {
  final List<SwitchItem> switchs;
  const AllSwitchSuccess({required this.switchs});
}

final class AllSwitchFailure extends SwitchState {
  final String message;
  const AllSwitchFailure({required this.message});
}

final class AddSwitchLoading extends SwitchState {}

final class AddSwitchSuccess extends SwitchState {
  final SwitchItem switchs;
  const AddSwitchSuccess({required this.switchs});
}

final class AddSwitchFailure extends SwitchState {
  final String message;
  const AddSwitchFailure({required this.message});
}
