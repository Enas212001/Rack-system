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
    id: json['id']?.toString(),
    rackId: json['rack_id']?.toString(),
    buildingRId: json['building_r_id']?.toString(),
    buildingName: json['building_name']?.toString(),
    hotelId: json['hotel_id']?.toString(),
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
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
