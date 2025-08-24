import 'package:equatable/equatable.dart';

class Switch extends Equatable {
  final int? id;
  final String? name;

  const Switch({this.id, this.name});

  factory Switch.fromJson(Map<String, dynamic> json) =>
      Switch(id: json['id'] as int?, name: json['name'] as String?);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  @override
  List<Object?> get props => [id, name];
}
