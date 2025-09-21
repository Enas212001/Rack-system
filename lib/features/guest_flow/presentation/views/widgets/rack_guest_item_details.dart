import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/item_detail.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_model/rack_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RackGuestItemDetails extends StatelessWidget {
  const RackGuestItemDetails({super.key, required this.rackItem});
  final RackItem rackItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        ItemDetail(label: 'Size :', value: rackItem.rackSize!.toString()),
        ItemDetail(label: 'Model :', value: rackItem.rackModel!),
        ItemDetail(label: 'Building :', value: rackItem.buildingId!.toString()),
      ],
    );
  }
}
