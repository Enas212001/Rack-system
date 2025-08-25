import 'package:equatable/equatable.dart';

import 'summary_item.dart';

class SummaryModel extends Equatable {
  final String? status;
  final String? message;
  final SummaryItem? data;

  const SummaryModel({this.status, this.message, this.data});

  factory SummaryModel.fromJson(Map<String, dynamic> json) => SummaryModel(
    status: json['status'] as String?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : SummaryItem.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };

  @override
  List<Object?> get props => [status, message, data];
}
