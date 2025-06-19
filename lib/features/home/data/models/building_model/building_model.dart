import 'package:equatable/equatable.dart';

class BuildingModel extends Equatable {
  final String? id;
  final String? rackId;
  final String? buildingRId;
  final String? buildingName;
  final String? hotelId;
  final dynamic createdAt;
  final dynamic updatedAt;

  const BuildingModel({
    this.id,
    this.rackId,
    this.buildingRId,
    this.buildingName,
    this.hotelId,
    this.createdAt,
    this.updatedAt,
  });

  factory BuildingModel.fromJson(Map<String, dynamic> json) => BuildingModel(
    id: json['id'] as String?,
    rackId: json['rack_id'] as String?,
    buildingRId: json['building_r_id'] as String?,
    buildingName: json['building_name'] as String?,
    hotelId: json['hotel_id'] as String?,
    createdAt: json['created_at'] as dynamic,
    updatedAt: json['updated_at'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'rack_id': rackId,
    'building_r_id': buildingRId,
    'building_name': buildingName,
    'hotel_id': hotelId,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  @override
  List<Object?> get props {
    return [
      id,
      rackId,
      buildingRId,
      buildingName,
      hotelId,
      createdAt,
      updatedAt,
    ];
  }
}
