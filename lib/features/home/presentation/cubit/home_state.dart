part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HotelLoading extends HomeState {}

final class HotelFailure extends HomeState {
  final String message;

  const HotelFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class HotelSuccess extends HomeState {
  final List<HotelModel> hotels;

  const HotelSuccess({required this.hotels});

  @override
  List<Object> get props => [hotels];
}

final class BuildingLoading extends HomeState {}

final class BuildingSuccess extends HomeState {
  final List<BuildingModel> buildings;

  const BuildingSuccess({required this.buildings});

  @override
  List<Object> get props => [buildings];
}

final class BuildingFailure extends HomeState {
  final String message;

  const BuildingFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class RacksLoading extends HomeState {}

final class RacksSuccess extends HomeState {
  final List<RackInfoModel> racks;

  const RacksSuccess({required this.racks});

  @override
  List<Object> get props => [racks];
}

final class RacksFailure extends HomeState {
  final String message;

  const RacksFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class AddBuildingLoading extends HomeState {}

final class AddBuildingSuccess extends HomeState {
  final BuildingModel building;

  const AddBuildingSuccess({required this.building});
}

final class AddBuildingFailure extends HomeState {
  final String message;

  const AddBuildingFailure({required this.message});
}

final class AddRackLoading extends HomeState {}

final class AddRackFailure extends HomeState {
  final String message;

  const AddRackFailure({required this.message});
}

final class AddRackSuccess extends HomeState {
  final RackInfoModel rack;

  const AddRackSuccess({required this.rack});
}
