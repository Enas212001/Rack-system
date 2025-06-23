// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/core/api/dio_consumer.dart';
// import 'package:flutter_application_1/core/func/upload_image_to_api.dart';
// import 'package:flutter_application_1/core/utils/service_locator.dart';
// import 'package:flutter_application_1/features/home/data/models/building_model/building_model.dart';
// import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';
// import 'package:flutter_application_1/features/home/data/models/rack_info_model/rack_info_model.dart';
// import 'package:flutter_application_1/features/home/data/repo/home_repo.dart';
// import 'package:flutter_application_1/features/home/data/repo/home_repo_impl.dart';
// import 'package:image_picker/image_picker.dart';

// part 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitial());
//   final HomeRepo homeRepo = HomeRepoImpl(api: getIt.get<DioConsumer>());

//   final GlobalKey<FormState> formAddBuildingKey = GlobalKey<FormState>();
//   // Controllers
//   final TextEditingController rackIdController = TextEditingController();
//   final TextEditingController buildingRackIdController =
//       TextEditingController();
//   final TextEditingController buildingNameController = TextEditingController();
//   final GlobalKey<FormState> formAddRackKey = GlobalKey<FormState>();

//   // Controllers
//   final TextEditingController productPanelController = TextEditingController();
//   final TextEditingController productSerialController = TextEditingController();
//   final TextEditingController productMacController = TextEditingController();
//   final TextEditingController productModelController = TextEditingController();
//   final TextEditingController productPortController = TextEditingController();
//   final TextEditingController deviceNameController = TextEditingController();
//   final TextEditingController siteNameController = TextEditingController();
//   final GlobalKey<FormState> formAddHotelKey = GlobalKey<FormState>();
//   final TextEditingController hotelNameController = TextEditingController();
//   final TextEditingController buildingNumberController =
//       TextEditingController();
//   String? selectedBuildingId;
//   String? selectedSwitchId;

//   List<String> buildingRackIds = ['R_u14', 'R_u15'];
//   List<String> switchIds = ['1', '2', '3'];

//   Future<void> getBuildings({required String hotelId}) async {
//     emit(BuildingLoading());
//     try {
//       final buildings = await homeRepo.getBuildings(hotelId: hotelId);
//       buildings.fold(
//         (failure) =>
//             emit(BuildingFailure(message: failure.failure.errorMessage)),
//         (buildings) => emit(BuildingSuccess(buildings: buildings)),
//       );
//     } catch (e) {
//       emit(BuildingFailure(message: e.toString()));
//     }
//   }

//   List<RackInfoModel> rackInfos = [];

//   Future<void> getRacksInfo() async {
//     emit(RacksLoading());
//     try {
//       final racks = await homeRepo.getRacksInfo();
//       racks.fold(
//         (failure) => emit(RacksFailure(message: failure.failure.errorMessage)),
//         (racks) => emit(RacksSuccess(racks: racks)),
//       );
//     } catch (e) {
//       emit(RacksFailure(message: e.toString()));
//     }
//   }

//   Future<void> addBuilding({required String hotelId}) async {
//     emit(AddBuildingLoading());
//     try {
//       final response = await homeRepo.addBuilding(
//         buildingName: buildingNameController.text,
//         rackId: rackIdController.text,
//         buildingRackId: buildingRackIdController.text,
//         hotelId: hotelId,
//       );
//       response.fold(
//         (failure) =>
//             emit(AddBuildingFailure(message: failure.failure.errorMessage)),
//         (building) {
//           emit(AddBuildingSuccess(building: building));
//           buildingNameController.clear();
//           rackIdController.clear();
//           buildingRackIdController.clear();
//         },
//       );
//     } catch (e) {
//       emit(AddBuildingFailure(message: e.toString()));
//     }
//   }

//   Future<void> addRack() async {
//     emit(AddRackLoading());
//     try {
//       final response = await homeRepo.addRack(
//         buildingRId: selectedBuildingId!,
//         switchId: selectedSwitchId!,
//         productPanel: productPanelController.text,
//         productSerial: productSerialController.text,
//         productMac: productMacController.text,
//         productModel: productModelController.text,
//         productPort: productPortController.text,
//         deviceName: deviceNameController.text,
//         siteName: siteNameController.text,
//       );
//       response.fold(
//         (failure) =>
//             emit(AddRackFailure(message: failure.failure.errorMessage)),
//         (rack) {
//           emit(AddRackSuccess(rack: rack));
//           productPanelController.clear();
//           productSerialController.clear();
//           productMacController.clear();
//           productModelController.clear();
//           productPortController.clear();
//           deviceNameController.clear();
//           siteNameController.clear();
//         },
//       );
//     } catch (e) {
//       emit(AddRackFailure(message: e.toString()));
//     }
//   }
// }
