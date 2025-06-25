import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/features/home/Buildings/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/cubit/rack_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../widget/add_button.dart';
import '../../../../widget/common_widget.dart';
import 'rack_info.dart';
import 'racks_grid_view.dart';

class RackViewBody extends StatelessWidget {
  const RackViewBody({
    super.key,
    required this.hotelModel,
    required this.buildingModel,
  });
  final HotelModel hotelModel;
  final BuildingModel buildingModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CommonWidget(popUp: true)),
        SliverToBoxAdapter(
          child: RacksInfo(
            hotelName: hotelModel.name!,
            id: hotelModel.id!,
            rackId: buildingModel.id!,
          ),
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
              final rackCubit = context.read<RackCubit>();
              GoRouter.of(context).push(
                AppRoutes.addRack,
                extra: AddRackArgs(
                  rackCubit: rackCubit,
                  buildingModel: buildingModel,
                ),
              );
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        RacksGridView(hotelModel: hotelModel, buildingModel: buildingModel),
      ],
    );
  }
}
