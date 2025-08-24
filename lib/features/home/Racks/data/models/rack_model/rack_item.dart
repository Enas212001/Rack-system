import 'package:equatable/equatable.dart';

import 'switch.dart';

class RackItem extends Equatable {
  final int? id;
  final String? rackName;
  final int? rackSize;
  final int? buildingId;
  final String? buildingRId;
  final String? switchId;
  final String? siteName;
  final String? createdAt;
  final String? updatedAt;
  final String? switchIds;
  final String? rackModel;
  final List<Switch>? switches;

  const RackItem({
    this.id,
    this.rackName,
    this.rackSize,
    this.buildingId,
    this.buildingRId,
    this.switchId,
    this.siteName,
    this.createdAt,
    this.updatedAt,
    this.switchIds,
    this.rackModel,
    this.switches,
  });

  factory RackItem.fromJson(Map<String, dynamic> json) => RackItem(
    id: json['id'] as int?,
    rackName: json['rack_name'] as String?,
    rackSize: json['rack_size'] as int?,
    buildingId: json['building_id'] as int?,
    buildingRId: json['building_r_id'] as String?,
    switchId: json['switch_id'] as String?,
    siteName: json['site_name'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    switchIds: json['switch_ids'] as String?,
    rackModel: json['rack_model'] as String?,
    switches: (json['switches'] as List<dynamic>?)
        ?.map((e) => Switch.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'rack_name': rackName,
    'rack_size': rackSize,
    'building_id': buildingId,
    'building_r_id': buildingRId,
    'switch_id': switchId,
    'site_name': siteName,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'switch_ids': switchIds,
    'rack_model': rackModel,
    'switches': switches?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      rackName,
      rackSize,
      buildingId,
      buildingRId,
      switchId,
      siteName,
      createdAt,
      updatedAt,
      switchIds,
      rackModel,
      switches,
    ];
  }
}
