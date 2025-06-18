import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'rack_item.dart';

class RacksGridView extends StatelessWidget {
  const RacksGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.rackInfo);
          },
          child: RackItem(),
        ),
        childCount: 5,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        mainAxisSpacing: 50.h,
      ),
    );
  }
}
