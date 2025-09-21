import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/item_detail.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuestViewItemDetails extends StatelessWidget {
  const GuestViewItemDetails({super.key, required this.buildingItem});
  final BuildingModel buildingItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        ItemDetail(label: 'Hotel Id :', value: buildingItem.hotelId!),
        ItemDetail(label: 'Rack Id :', value: buildingItem.rackId!),
        ItemDetail(
          label: 'Building Rack Id :',
          value: buildingItem.buildingRId!,
        ),
      ],
    );
  }
}
