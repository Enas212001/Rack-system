import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? roleId;
  final int? hotelId;
  final String? createdAt;

  const User({
    this.id,
    this.name,
    this.email,
    this.roleId,
    this.hotelId,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    roleId: json['role_id'] as String?,
    hotelId: json['hotel_id'] as int?,
    createdAt: json['created_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'role_id': roleId,
    'hotel_id': hotelId,
    'created_at': createdAt,
  };

  @override
  List<Object?> get props {
    return [id, name, email, roleId, hotelId, createdAt];
  }
}
