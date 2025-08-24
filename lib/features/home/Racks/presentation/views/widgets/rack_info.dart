import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RacksInfo extends StatelessWidget {
  const RacksInfo({super.key, required this.hotelName, required this.id});
  final String hotelName, id;

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
                ' /Buildings > Building $id',
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
