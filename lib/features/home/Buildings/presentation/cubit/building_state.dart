part of 'building_cubit.dart';

sealed class BuildingState extends Equatable {
  const BuildingState();

  @override
  List<Object> get props => [];
}

final class BuildingInitial extends BuildingState {}

final class BuildingLoading extends BuildingState {}

final class BuildingSuccess extends BuildingState {
  final List<BuildingModel> buildings;

  const BuildingSuccess({required this.buildings});

  @override
  List<Object> get props => [buildings];
}

final class BuildingFailure extends BuildingState {
  final String message;

  const BuildingFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class AddBuildingLoading extends BuildingState {}

final class AddBuildingSuccess extends BuildingState {
  final BuildingModel building;

  const AddBuildingSuccess({required this.building});
}

final class AddBuildingFailure extends BuildingState {
  final String message;

  const AddBuildingFailure({required this.message});
}

final class EditBuildingLoading extends BuildingState {}

final class EditBuildingSuccess extends BuildingState {
  final BuildingModel building;

  const EditBuildingSuccess({required this.building});
}

final class EditBuildingFailure extends BuildingState {
  final String message;

  const EditBuildingFailure({required this.message});
}

final class DeleteBuildingLoading extends BuildingState {}

final class DeleteBuildingSuccess extends BuildingState {
  final BuildingModel building;

  const DeleteBuildingSuccess({required this.building});
}

final class DeleteBuildingFailure extends BuildingState {
  final String message;

  const DeleteBuildingFailure({required this.message});
}
