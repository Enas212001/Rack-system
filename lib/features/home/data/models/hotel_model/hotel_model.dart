import 'package:equatable/equatable.dart';

class HotelModel extends Equatable {
	final String? id;
	final String? name;
	final String? buildingId;
	final String? logo;
	final dynamic createdAt;
	final dynamic updatedAt;

	const HotelModel({
		this.id, 
		this.name, 
		this.buildingId, 
		this.logo, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
				id: json['id'] as String?,
				name: json['name'] as String?,
				buildingId: json['building_id'] as String?,
				logo: json['logo'] as String?,
				createdAt: json['created_at'] as dynamic,
				updatedAt: json['updated_at'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'building_id': buildingId,
				'logo': logo,
				'created_at': createdAt,
				'updated_at': updatedAt,
			};

	@override
	List<Object?> get props {
		return [
				id,
				name,
				buildingId,
				logo,
				createdAt,
				updatedAt,
		];
	}
}
