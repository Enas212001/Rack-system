import 'package:equatable/equatable.dart';

class RackInfoModel extends Equatable {
  final String? id;
  final String? buildingRId;
  final String? switchId;
  final String? productPanal;
  final String? productSerial;
  final String? productMac;
  final String? productModel;
  final String? productPort;
  final String? deviceName;
  final String? siteName;
  final dynamic createdAt;
  final dynamic updatedAt;

  const RackInfoModel({
    this.id,
    this.buildingRId,
    this.switchId,
    this.productPanal,
    this.productSerial,
    this.productMac,
    this.productModel,
    this.productPort,
    this.deviceName,
    this.siteName,
    this.createdAt,
    this.updatedAt,
  });

  factory RackInfoModel.fromJson(Map<String, dynamic> json) => RackInfoModel(
    id: json['id']?.toString(),
    buildingRId: json['building_r_id'] as String?,
    switchId: json['switch_id'] as String?,
    productPanal: json['product_panal'] as String?,
    productSerial: json['product_serial'] as String?,
    productMac: json['product_mac'] as String?,
    productModel: json['product_model'] as String?,
    productPort: json['product_port'] as String?,
    deviceName: json['device_name'] as String?,
    siteName: json['site_name'] as String?,
    createdAt: json['created_at'] as dynamic,
    updatedAt: json['updated_at'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'building_r_id': buildingRId,
    'switch_id': switchId,
    'product_panal': productPanal,
    'product_serial': productSerial,
    'product_mac': productMac,
    'product_model': productModel,
    'product_port': productPort,
    'device_name': deviceName,
    'site_name': siteName,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  @override
  List<Object?> get props {
    return [
      id,
      buildingRId,
      switchId,
      productPanal,
      productSerial,
      productMac,
      productModel,
      productPort,
      deviceName,
      siteName,
      createdAt,
      updatedAt,
    ];
  }
}
