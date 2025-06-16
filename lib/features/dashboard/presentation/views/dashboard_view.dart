import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'widget/common_widget.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  AddClientWidget(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(child: ImageGridView())),
          ],
        ),
      ),
    );
  }
}

class NotificationsNumberWidget extends StatelessWidget {
  const NotificationsNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'You have',
        style: Theme.of(context).textTheme.titleSmall,
        children: [
          TextSpan(
            text: ' 2 Unread',
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: AppColors.primaryColor),
          ),
          TextSpan(
            text: ' Notifications',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}

class AddClientWidget extends StatelessWidget {
  const AddClientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Our Clients', style: Theme.of(context).textTheme.titleMedium),
        Spacer(),
        Row(
          children: [
            Container(
              color: Colors.black,
              width: 86.w,
              height: 19.h,
              alignment: Alignment.center,
              child: Text(
                '+Add User',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(width: 5.w),
            Image.asset(Assets.imagesAddIcon),
          ],
        ),
      ],
    );
  }
}

class ImageGridView extends StatelessWidget {
  const ImageGridView({super.key});
  final List<String> imagePaths = const [
    Assets.imagesHotel1,
    Assets.imagesHotel2,
    Assets.imagesHotel3,
    Assets.imagesHotel4,
    Assets.imagesHotel5,
    Assets.imagesHotel6,
    Assets.imagesHotel7,
    Assets.imagesHotel8,
    Assets.imagesHotel9,
    Assets.imagesHotel10,
    Assets.imagesHotel1,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: imagePaths.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push('/building');
          },
          child: Image.asset(imagePaths[index]),
        );
      },
    );
  }
}

class IconWithBorder extends StatelessWidget {
  const IconWithBorder({super.key, required this.icon});
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: Container(
        width: 36.r,
        height: 36.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey, // customize color
            width: 1.w, // customize thickness
          ),
        ),
        child: Icon(icon),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 8), // shadow below
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(Assets.imagesPowerSMTPLogo, width: 52.w, height: 52.h),
          Container(
            height: 46.h,
            width: 1.5.w,
            color: AppColors.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 6.w),
          ),
          IconWithTitle(image: Assets.imagesClients, title: 'Our Clients'),
          IconWithTitle(title: 'Buildings', image: Assets.imagesBuildings),
          IconWithTitle(
            title: 'Settings',
            image: Assets.imagesSettings,
            color: Colors.black,
          ),
          IconWithTitle(
            title: 'Help Center',
            image: Assets.imagesHelpCenter,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class IconWithTitle extends StatelessWidget {
  const IconWithTitle({
    super.key,
    required this.title,
    required this.image,
    this.color = AppColors.primaryColor,
  });
  final String title, image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Image.asset(image, width: 32.w, height: 38.h),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.displaySmall!.copyWith(color: color),
          ),
          SizedBox(width: 5.w),
        ],
      ),
    );
  }
}
