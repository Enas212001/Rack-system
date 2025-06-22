import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/features/home/data/models/hotel_model/hotel_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'add_button.dart';
import 'common_widget.dart';
import 'rack_info.dart';
import 'racks_grid_view.dart';

class RackViewBody extends StatelessWidget {
  const RackViewBody({super.key, required this.hotelModel});
  final HotelModel hotelModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CommonWidget()),
        SliverToBoxAdapter(
          child: RacksInfo(hotelName: hotelModel.name!, id: hotelModel.id!),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        SliverToBoxAdapter(
          child: Image.network(
            '${Endpoints.baseUrlImage}/${hotelModel.logo!.trim()}',
            height: 80.h,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10.h)),
        SliverToBoxAdapter(
          child: AddButton(
            textButton: '+ Add Rack',
            onTap: () {
              GoRouter.of(context).push(AppRoutes.addRack, extra: hotelModel);
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        RacksGridView(hotelModel: hotelModel),
      ],
    );
  }
}
