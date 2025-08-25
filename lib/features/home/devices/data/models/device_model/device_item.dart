import 'package:equatable/equatable.dart';

class DeviceItem extends Equatable {
  final int? id;
  final int? switchId;
  final int? portNumber;
  final String? deviceName;
  final String? deviceSerial;
  final String? macAddress;
  final String? ipAddress;
  final String? patchPanel;
  final String? productNumber;
  final String? deviceModel;
  final String? createdAt;
  final String? updatedAt;

  const DeviceItem({
    this.id,
    this.switchId,
    this.portNumber,
    this.deviceName,
    this.deviceSerial,
    this.macAddress,
    this.ipAddress,
    this.patchPanel,
    this.productNumber,
    this.deviceModel,
    this.createdAt,
    this.updatedAt,
  });

  factory DeviceItem.fromJson(Map<String, dynamic> json) => DeviceItem(
    id: json['id'] as int?,
    switchId: json['switch_id'] as int?,
    portNumber: json['port_number'] as int?,
    deviceName: json['device_name'] as String?,
    deviceSerial: json['device_serial'] as String?,
    macAddress: json['mac_address'] as String?,
    ipAddress: json['ip_address'] as String?,
    patchPanel: json['patch_panel'] as String?,
    productNumber: json['product_number'] as String?,
    deviceModel: json['device_model'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'switch_id': switchId,
    'port_number': portNumber,
    'device_name': deviceName,
    'device_serial': deviceSerial,
    'mac_address': macAddress,
    'ip_address': ipAddress,
    'patch_panel': patchPanel,
    'product_number': productNumber,
    'device_model': deviceModel,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  @override
  List<Object?> get props {
    return [
      id,
      switchId,
      portNumber,
      deviceName,
      deviceSerial,
      macAddress,
      ipAddress,
      patchPanel,
      productNumber,
      deviceModel,
      createdAt,
      updatedAt,
    ];
  }
}
