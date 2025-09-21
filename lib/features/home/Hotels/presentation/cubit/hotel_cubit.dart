import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/dio_consumer.dart';
import 'package:flutter_application_1/core/func/upload_image_to_api.dart';
import 'package:flutter_application_1/core/service/service_locator.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Hotels/data/repo/hotel_repo.dart';
import 'package:flutter_application_1/features/home/Hotels/data/repo/hotel_repo_impl.dart';
import 'package:image_picker/image_picker.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());
  final HotelRepo homeRepo = HotelRepoImpl(api: getIt.get<DioConsumer>());

  final GlobalKey<FormState> formAddHotelKey = GlobalKey<FormState>();
  final TextEditingController hotelNameController = TextEditingController();
  final TextEditingController buildingNumberController =
      TextEditingController();
  XFile? imageFromGallery;
  List<HotelModel> _allHotels = [];
  Future<void> getHotels() async {
    emit(HotelLoading());
    try {
      final result = await homeRepo.getHotels();
      result.fold(
        (failure) => emit(HotelFailure(message: failure.failure.errorMessage)),
        (hotels) {
          _allHotels = hotels;
          emit(HotelSuccess(hotels: hotels));
        },
      );
    } catch (e) {
      emit(HotelFailure(message: e.toString()));
    }
  }

  void searchHotels(String query) {
    if (state is! HotelSuccess) return;

    if (query.isEmpty) {
      emit(HotelSuccess(hotels: _allHotels));
      return;
    }

    final filtered = _allHotels.where((hotel) {
      final name = hotel.name?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();

    emit(HotelSuccess(hotels: filtered));
  }

  Future<void> addHotel() async {
    emit(AddHotelLoading());
    try {
      final response = await homeRepo.addHotel(
        hotelName: hotelNameController.text,
        buildingNumber: buildingNumberController.text,
        image: await upLoadImageToApi(imageFromGallery!),
      );
      response.fold(
        (failure) =>
            emit(AddHotelFailure(message: failure.failure.errorMessage)),
        (hotel) {
          emit(AddHotelSuccess(hotel: hotel));
          hotelNameController.clear();
          buildingNumberController.clear();
          imageFromGallery = null;
        },
      );
    } catch (e) {
      emit(AddHotelFailure(message: e.toString()));
    }
  }

  Future<void> pickImageWithGallery() async {
    try {
      final returnedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (returnedImage == null) return;

      imageFromGallery = XFile(returnedImage.path);
    } catch (e) {
      log(e.toString());
    }
  }
}
