import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_button.dart';
import 'common_widget.dart';
import 'rack_info.dart';
import 'racks_grid_view.dart';

class RackViewBody extends StatelessWidget {
  const RackViewBody({super.key, required this.hotelAsset});
  final String hotelAsset;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CommonWidget()),
        SliverToBoxAdapter(child: RacksInfo()),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        SliverToBoxAdapter(
          child: Image.network(
            '${Endpoints.baseUrlImage}/$hotelAsset',
            height: 80.h,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10.h)),
        SliverToBoxAdapter(child: AddButton(textButton: '+ Add Rack')),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        RacksGridView(hotelAssets: hotelAsset),
      ],
    );
  }
}
