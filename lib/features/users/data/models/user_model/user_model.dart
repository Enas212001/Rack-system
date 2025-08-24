import 'package:equatable/equatable.dart';

import 'user_item.dart';

class UserModel extends Equatable {
  final String? status;
  final List<UserItem>? data;

  const UserModel({this.status, this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json['status'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => UserItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [status, data];
}
