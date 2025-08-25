import 'package:equatable/equatable.dart';

class SummaryItem extends Equatable {
  final String? id;
  final String? switchId;
  final String? apRoom;
  final String? apOut;
  final String? cctvIn;
  final String? cctvOut;
  final String? createdAt;
  final String? updatedAt;

  const SummaryItem({
    this.id,
    this.switchId,
    this.apRoom,
    this.apOut,
    this.cctvIn,
    this.cctvOut,
    this.createdAt,
    this.updatedAt,
  });

  factory SummaryItem.fromJson(Map<String, dynamic> json) => SummaryItem(
    id: json['id'] as String?,
    switchId: json['switch_id'] as String?,
    apRoom: json['ap_room'] as String?,
    apOut: json['ap_out'] as String?,
    cctvIn: json['cctv_in'] as String?,
    cctvOut: json['cctv_out'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'switch_id': switchId,
    'ap_room': apRoom,
    'ap_out': apOut,
    'cctv_in': cctvIn,
    'cctv_out': cctvOut,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  @override
  List<Object?> get props {
    return [id, switchId, apRoom, apOut, cctvIn, cctvOut, createdAt, updatedAt];
  }
}
