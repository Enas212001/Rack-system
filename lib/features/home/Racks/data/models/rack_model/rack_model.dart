import 'package:equatable/equatable.dart';

import 'rack_item.dart';

class RackModel extends Equatable {
  final bool? status;
  final String? message;
  final List<RackItem>? data;

  const RackModel({this.status, this.message, this.data});

  factory RackModel.fromJson(Map<String, dynamic> json) => RackModel(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => RackItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [status, message, data];
}
