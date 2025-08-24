import 'package:equatable/equatable.dart';

class UserItem extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? roleId;
  final dynamic hotelId;
  final String? createdAt;
  final String? updatedAt;

  const UserItem({
    this.id,
    this.name,
    this.email,
    this.roleId,
    this.hotelId,
    this.createdAt,
    this.updatedAt,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
    id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
    name: json['name'] as String?,
    email: json['email'] as String?,
    roleId: json['role_id'] as String?,
    hotelId: json['hotel_id'] as dynamic,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'role_id': roleId,
    'hotel_id': hotelId,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  @override
  List<Object?> get props {
    return [id, name, email, roleId, hotelId, createdAt, updatedAt];
  }
}
