import 'package:equatable/equatable.dart';

import 'switch_item.dart';

class SwitchModel extends Equatable {
  final String? status;
  final String? message;
  final SwitchItem? data;

  const SwitchModel({this.status, this.message, this.data});

  factory SwitchModel.fromJson(Map<String, dynamic> json) => SwitchModel(
    status: json['status'] as String?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : SwitchItem.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };

  @override
  List<Object?> get props => [status, message, data];
}
