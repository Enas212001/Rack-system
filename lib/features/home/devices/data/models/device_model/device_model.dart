import 'package:equatable/equatable.dart';

import 'device_item.dart';

class DeviceModel extends Equatable {
  final String? status;
  final List<DeviceItem>? data;

  const DeviceModel({this.status, this.data});

  factory DeviceModel.fromJson(Map<String, dynamic> json) => DeviceModel(
    status: json['status'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DeviceItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [status, data];
}
