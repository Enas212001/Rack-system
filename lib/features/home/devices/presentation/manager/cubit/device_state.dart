part of 'device_cubit.dart';

sealed class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object> get props => [];
}

final class DeviceInitial extends DeviceState {}

final class DeviceLoading extends DeviceState {}

final class DeviceSuccess extends DeviceState {
  final List<DeviceItem> devices;
  const DeviceSuccess({required this.devices});
}

final class DeviceFailure extends DeviceState {
  final String failure;
  const DeviceFailure({required this.failure});
}

final class DeviceAddLoading extends DeviceState {}

final class DeviceAddSuccess extends DeviceState {
  final List<DeviceItem> device;
  const DeviceAddSuccess({required this.device});
}

final class DeviceAddFailure extends DeviceState {
  final String failure;
  const DeviceAddFailure({required this.failure});
}

final class DeviceEditLoading extends DeviceState {}

final class DeviceEditSuccess extends DeviceState {
  final DeviceItem device;
  const DeviceEditSuccess({required this.device});
}

final class DeviceEditFailure extends DeviceState {
  final String failure;
  const DeviceEditFailure({required this.failure});
}

final class DeviceDeleteLoading extends DeviceState {}

final class DeviceDeleteSuccess extends DeviceState {
  final String message;
  const DeviceDeleteSuccess({required this.message});
}

final class DeviceDeleteFailure extends DeviceState {
  final String failure;
  const DeviceDeleteFailure({required this.failure});
}
