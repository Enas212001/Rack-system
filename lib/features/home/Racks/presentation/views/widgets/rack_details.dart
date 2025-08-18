import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_info_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/widget/item_detail.dart';

class RackDetails extends StatelessWidget {
  const RackDetails({super.key, required this.rack});

  final RackInfoModel rack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDetail(label: 'Serial Number', value: rack.productSerial),
          ItemDetail(label: 'MAC Address', value: rack.productMac),
          ItemDetail(label: 'Site Name', value: rack.siteName),
          ItemDetail(label: 'Model', value: rack.productModel),
          ItemDetail(label: 'Switch Port', value: rack.productPort),
          ItemDetail(label: 'Patch Panel Port', value: rack.productPanal),
        ],
      ),
    );
  }
}
