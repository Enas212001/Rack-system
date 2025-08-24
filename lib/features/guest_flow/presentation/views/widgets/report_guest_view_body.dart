import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/widget/top_with_back.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'devices_connected_to_switch.dart';
import 'summary_widget.dart';
import 'switch_information.dart';
import 'text_primary_16.dart';

class ReportGuestViewBody extends StatelessWidget {
  const ReportGuestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: TopWithBack(text: 'Report', noSearch: true)),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text16MeduimPrimaryColor(text: 'Rack information'),
                Row(
                  children: [
                    SvgPicture.asset(Assets.imagesExport),
                    SizedBox(width: 4.w),
                    Text16MeduimPrimaryColor(text: 'Export'),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SwitchInformation()),
        SliverToBoxAdapter(child: SummaryWidget()),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Text16MeduimPrimaryColor(
              text: 'Devices connected to switch',
            ),
          ),
        ),
        SliverToBoxAdapter(child: DevicesConnectedToSwitch()),
      ],
    );
  }
}
