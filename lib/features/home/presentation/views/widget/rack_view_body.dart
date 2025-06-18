import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_button.dart';
import 'common_widget.dart';
import 'rack_info.dart';
import 'racks_grid_view.dart';

class RackViewBody extends StatelessWidget {
  const RackViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CommonWidget()),
        SliverToBoxAdapter(child: RacksInfo()),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        SliverToBoxAdapter(
          child: Image.asset(Assets.imagesHotel1, height: 80.h),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10.h)),
        SliverToBoxAdapter(child: AddButton(textButton: '+ Add Rack')),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        RacksGridView(),
      ],
    );
  }
}
