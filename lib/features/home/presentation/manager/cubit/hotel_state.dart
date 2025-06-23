part of 'hotel_cubit.dart';

sealed class HotelState extends Equatable {
  const HotelState();

  @override
  List<Object> get props => [];
}

final class HotelInitial extends HotelState {}

final class HotelLoading extends HotelState {}

final class HotelFailure extends HotelState {
  final String message;

  const HotelFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class HotelSuccess extends HotelState {
  final List<HotelModel> hotels;

  const HotelSuccess({required this.hotels});

  @override
  List<Object> get props => [hotels];
}

final class AddHotelLoading extends HotelState {}

final class AddHotelSuccess extends HotelState {
  final HotelModel hotel;

  const AddHotelSuccess({required this.hotel});
}

final class AddHotelFailure extends HotelState {
  final String message;

  const AddHotelFailure({required this.message});
}

final class PickHotelFromGalleryLoading extends HotelState {}

final class PickHotelFromGallerySuccess extends HotelState {}

final class PickHotelFromGalleryFailure extends HotelState {
  final String message;

  const PickHotelFromGalleryFailure({required this.message});
}
