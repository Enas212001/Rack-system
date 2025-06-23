import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_widget.dart';
import 'rack_info.dart';
import 'rack_info_builder.dart';

class RackInfoViewBody extends StatelessWidget {
  const RackInfoViewBody({super.key, required this.hotelModel});
  final HotelModel hotelModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonWidget(),
        SizedBox(height: 50.h),
        RacksInfo(hotelName: hotelModel.name!, id: hotelModel.id!),
        SizedBox(height: 20.h),
        Image.network(
          '${Endpoints.baseUrlImage}/${hotelModel.logo!.trim()}',
          height: 80.h,
        ),
        SizedBox(height: 10.h),
        RackInfoBuilder(),
        SizedBox(height: 20.h),
        // BackAndNextButton(),
      ],
    );
  }
}
