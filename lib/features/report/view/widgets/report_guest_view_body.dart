import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/widget/top_with_back.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'devices_connected_to_switch.dart';
import 'export_report.dart';
import 'summary_widget.dart';
import 'switch_information.dart';
import 'text_primary_16.dart';

class ReportGuestViewBody extends StatelessWidget {
  const ReportGuestViewBody({super.key, required this.switchItem});
  final SwitchItem switchItem;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: TopWithBack(text: 'Report', noSearch: true, withDrawer: false),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text16MeduimPrimaryColor(
                  text: 'Switch Report - ${switchItem.name}',
                ),
                Row(
                  children: [
                    SvgPicture.asset(Assets.imagesExport),
                    SizedBox(width: 4.w),
                    ExportSwitchInfo(switchItem: switchItem),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SwitchInformation(switchItem: switchItem)),
        SliverToBoxAdapter(child: SummaryWidget(switchItem: switchItem)),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Text16MeduimPrimaryColor(
              text: 'Devices connected to switch',
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) =>
                DeviceCubit()..getDevices(switchId: switchItem.id!.toString()),
            child: DevicesConnectedToSwitch(),
          ),
        ),
      ],
    );
  }
}
