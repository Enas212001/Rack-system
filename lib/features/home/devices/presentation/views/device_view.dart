import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widget/add_text_button.dart';
import 'package:flutter_application_1/core/utils/widget/top_with_back.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'widgets/devices_list_view.dart';

class DeviceView extends StatelessWidget {
  const DeviceView({super.key, required this.switchItem});
  final SwitchItem switchItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DeviceViewBody(switchItem: switchItem));
  }
}

class DeviceViewBody extends StatelessWidget {
  const DeviceViewBody({super.key, required this.switchItem});

  final SwitchItem switchItem;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(child: TopWithBack(text: 'Devices')),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16.r) +
                EdgeInsets.only(top: 16.h),
            child: Row(
              children: [
                Text(
                  'Devices for: ${switchItem.name} switch',
                  style: CustomTextStyles.text16MeduimText.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const Spacer(),
                AddTextButton(
                  title: '+ Add Device',
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.addDevice);
                  },
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) =>
                DeviceCubit()..getDevices(switchId: switchItem.id.toString()),
            child: DevicesListView(),
          ),
        ),
      ],
    );
  }
}
