import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'back_and_next_button.dart';
import 'common_widget.dart';
import 'rack_info.dart';
import 'rack_info_table.dart';

class RackInfoViewBody extends StatelessWidget {
  const RackInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonWidget(),
        SizedBox(height: 50.h),
        RacksInfo(),
        SizedBox(height: 20.h),
        Image.asset(Assets.imagesHotel1, height: 80.h),
        SizedBox(height: 10.h),
        RockInfoTable(),
        SizedBox(height: 20.h),
        BackAndNextButton(),
      ],
    );
  }
}
