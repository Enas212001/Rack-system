import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'building_view.dart';
import 'widget/common_widget.dart';

class RacksView extends StatelessWidget {
  const RacksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CommonWidget()),
            SliverToBoxAdapter(child: RacksInfo()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(
              child: Image.asset(Assets.imagesHotel1, height: 80.h),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            SliverToBoxAdapter(
              child: AddBuildingButton(textButton: '+ Add Rack'),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => RackItem(),
                childCount: 5,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                mainAxisSpacing: 50.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RackItem extends StatelessWidget {
  const RackItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 86.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkBlueColor, width: 2.w),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(7.w),
            child: Column(
              children: [
                Text(
                  'Rack',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
                Text(
                  '1',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
              ],
            ),
          ),
          Container(color: AppColors.darkBlueColor, height: 5.h),
        ],
      ),
    );
  }
}

class RacksInfo extends StatelessWidget {
  const RacksInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 12.h) + EdgeInsets.only(left: 28.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconTextWithBG(text: 'Export', icon: Icons.open_in_new),
              SizedBox(width: 8.w),
              Image.asset(Assets.imagesAddIcon),
            ],
          ),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  text: 'Steigenberge ',
                  style: Theme.of(context).textTheme.titleSmall,
                  children: [
                    TextSpan(
                      text: '/Buildings > Building 1',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
