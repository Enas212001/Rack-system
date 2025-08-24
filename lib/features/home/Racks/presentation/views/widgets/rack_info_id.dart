import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RacksInfoId extends StatelessWidget {
  const RacksInfoId({
    super.key,
    required this.hotelName,
    required this.id,
    required this.rackId,
  });
  final String hotelName, id, rackId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                hotelName[0].toUpperCase() +
                    hotelName.substring(1).toLowerCase(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                ' > Building $id',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                ' > Racks $rackId',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
