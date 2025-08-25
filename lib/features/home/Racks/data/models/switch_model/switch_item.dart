import 'package:equatable/equatable.dart';

class SwitchItem extends Equatable {
  final int? id;
  final String? name;
  final String? serialNumber;
  final String? macAdd;
  final String? ipAdd;
  final String? upLinkCore1;
  final String? upLinkCore2;
  final int? portNumber;
  final String? model;
  final String? createdAt;
  final String? updatedAt;
  final int? hotelId;

  const SwitchItem({
    this.id,
    this.name,
    this.serialNumber,
    this.macAdd,
    this.ipAdd,
    this.upLinkCore1,
    this.upLinkCore2,
    this.portNumber,
    this.model,
    this.createdAt,
    this.updatedAt,
    this.hotelId,
  });

  factory SwitchItem.fromJson(Map<String, dynamic> json) => SwitchItem(
    id: json['id'] as int?,
    name: json['name'] as String?,
    serialNumber: json['serial_number'] as String?,
    macAdd: json['mac_add'] as String?,
    ipAdd: json['ip_add'] as String?,
    upLinkCore1: json['up_link_core1'] as String?,
    upLinkCore2: json['up_link_core2'] as String?,
    portNumber: json['port_number'] as int?,
    model: json['model'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    hotelId: json['hotel_id'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'serial_number': serialNumber,
    'mac_add': macAdd,
    'ip_add': ipAdd,
    'up_link_core1': upLinkCore1,
    'up_link_core2': upLinkCore2,
    'port_number': portNumber,
    'model': model,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'hotel_id': hotelId,
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      serialNumber,
      macAdd,
      ipAdd,
      upLinkCore1,
      upLinkCore2,
      portNumber,
      model,
      createdAt,
      updatedAt,
      hotelId,
    ];
  }
}
