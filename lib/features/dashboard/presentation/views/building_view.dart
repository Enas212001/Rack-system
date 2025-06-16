import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/dashboard/presentation/views/widget/common_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildingView extends StatelessWidget {
  const BuildingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CommonWidget()),
            SliverToBoxAdapter(child: BuildingInfo()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(
              child: Image.asset(Assets.imagesHotel1, height: 80.h),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            SliverToBoxAdapter(child: TableData()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(child: AddBuildingButton()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),

            // The grid
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => BuildingItem(),
                childCount: 5,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildingItem extends StatelessWidget {
  const BuildingItem({super.key});

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
                  'Buildind',
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
          Container(color: AppColors.backgroundColor, height: 5.h),
        ],
      ),
    );
  }
}

class BuildingInfo extends StatelessWidget {
  const BuildingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 12.h) + EdgeInsets.only(left: 28.w),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              text: 'Steigenberge ',
              style: Theme.of(context).textTheme.titleSmall,
              children: [
                TextSpan(
                  text: '/Buildings',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Spacer(),
          IconTextWithBG(icon: Icons.calendar_month_outlined, text: 'Date'),
          SizedBox(width: 8.w),
          IconTextWithBG(text: 'Export', icon: Icons.open_in_new),
          SizedBox(width: 8.w),
          Image.asset(Assets.imagesAddIcon),
        ],
      ),
    );
  }
}

class AddBuildingButton extends StatelessWidget {
  const AddBuildingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        margin: EdgeInsets.only(right: 18.w),
        decoration: BoxDecoration(
          color: AppColors.darkBlueColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Text(
          '+ Add Building',
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}

class TableData extends StatelessWidget {
  const TableData({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: AppColors.blackColor),
      children: [
        TableRow(
          decoration: BoxDecoration(color: AppColors.primaryColor),
          children: [
            TableItem(text: 'Vlan Name', color: AppColors.primaryColor),
            TableItem(text: 'Vlan ID', color: AppColors.primaryColor),
            TableItem(text: 'Colour Code', color: AppColors.primaryColor),
          ],
        ),
        TableRow(
          children: [
            TableItem(text: 'Camera', color: AppColors.backgroundColor),
            TableItem(text: '60'),
            TableItem(text: 'Turquoise'),
          ],
        ),
        TableRow(
          children: [
            TableItem(text: 'Admin', color: AppColors.backgroundColor),
            TableItem(text: '80'),
            TableItem(text: 'Green'),
          ],
        ),
      ],
    );
  }
}

class TableItem extends StatelessWidget {
  const TableItem({super.key, required this.text, this.color});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h, // Adjust row height here
      alignment: Alignment.center, // Center vertically & horizontally
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: color ?? AppColors.whiteColor,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14, // Optional: adjust font size
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class IconTextWithBG extends StatelessWidget {
  const IconTextWithBG({super.key, this.icon, required this.text});
  final IconData? icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(color: AppColors.backgroundColor),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 4.w),
          Text(text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
