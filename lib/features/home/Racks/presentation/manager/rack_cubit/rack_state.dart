part of 'rack_cubit.dart';

sealed class RackState extends Equatable {
  const RackState();

  @override
  List<Object> get props => [];
}

final class RackInitial extends RackState {}

final class RacksLoading extends RackState {}

final class RacksSuccess extends RackState {
  final List<RackItem> racks;

  const RacksSuccess({required this.racks});

  @override
  List<Object> get props => [racks];
}

final class RacksFailure extends RackState {
  final String message;

  const RacksFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class AddRackLoading extends RackState {}

final class AddRackFailure extends RackState {
  final String message;

  const AddRackFailure({required this.message});
}

final class AddRackSuccess extends RackState {
  final RackItem rack;

  const AddRackSuccess({required this.rack});
}

final class EditRackLoading extends RackState {}

final class EditRackFailure extends RackState {
  final String message;

  const EditRackFailure({required this.message});
}

final class EditRackSuccess extends RackState {
  final RackItem rack;

  const EditRackSuccess({required this.rack});
}

final class DeleteRackLoading extends RackState {}

final class DeleteRackFailure extends RackState {
  final String message;

  const DeleteRackFailure({required this.message});
}

final class DeleteRackSuccess extends RackState {
  final RackItem rack;

  const DeleteRackSuccess({required this.rack});
}
