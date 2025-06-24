import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Buildings/cubit/building_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../widget/add_button.dart';
import 'building_grid_view.dart';
import 'building_info.dart';
import '../../../../widget/common_widget.dart';
import '../../../../Racks/presentation/views/widgets/table_building.dart';

class BuildingViewBody extends StatelessWidget {
  const BuildingViewBody({super.key, required this.hotelModel});
  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CommonWidget(popUp: true)),
        SliverToBoxAdapter(child: BuildingInfo(hotelName: hotelModel.name!)),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        SliverToBoxAdapter(
          child: Image.network(
            '${Endpoints.baseUrlImage}/${hotelModel.logo!.trim()}',
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
              final buildingCubit = context.read<BuildingCubit>();
              GoRouter.of(context).push(
                AppRoutes.addBuilding,
                extra: AddBuildingArgs(
                  hotel: hotelModel,
                  buildingCubit: buildingCubit,
                ),
              );
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        BuildingGridView(hotelModel: hotelModel),
      ],
    );
  }
}
