import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'add_button.dart';
import 'building_grid_view.dart';
import 'building_info.dart';
import 'common_widget.dart';
import 'table_building.dart';

class BuildingViewBody extends StatelessWidget {
  const BuildingViewBody({
    super.key,
    required this.hotelName,
  });
    final HotelModel hotelName;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CommonWidget()),
        SliverToBoxAdapter(child: BuildingInfo(hotelName: hotelName.name!)),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        SliverToBoxAdapter(
          child: Image.network(
            '${Endpoints.baseUrlImage}/${hotelName.logo!.trim()}',
            height: 80.h,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10.h)),
        SliverToBoxAdapter(child: TableData()),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        SliverToBoxAdapter(
          child: AddButton(
            textButton: '+ Add Building',
            onTap: () {
              GoRouter.of(context).push(AppRoutes.addBuilding);
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        BuildingGridView(hotelModel: hotelName),
      ],
    );
  }
}
