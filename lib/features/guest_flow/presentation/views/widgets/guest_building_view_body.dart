import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/core/utils/widget/shimmer_widget.dart';
import 'package:flutter_application_1/core/utils/widget/top_with_back.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/cubit/building_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'building_guest_item.dart';

class GuestBuildingViewBody extends StatelessWidget {
  const GuestBuildingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<BuildingCubit>().getBuildings(
        hotelId: getIt
            .get<CacheHelper>()
            .getData(key: CacheKey.userHotelId)
            .toString(),
      ),
      color: AppColors.primaryColor,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: TopWithBack(
              text:
                  'Welcome, ${getIt.get<CacheHelper>().getData(key: CacheKey.userName)}',
              noSearch: true,
            ),
          ),
          BlocBuilder<BuildingCubit, BuildingState>(
            builder: (context, state) {
              if (state is BuildingSuccess) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return BuildingGuestItem(
                      buildingItem: state.buildings[index],
                    );
                  }, childCount: state.buildings.length),
                );
              } else if (state is BuildingFailure) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(state.message)),
                );
              } else if (state is BuildingLoading) {
                return ShimmerWidget(height: 165);
              }
              return SliverToBoxAdapter();
            },
          ),
        ],
      ),
    );
  }
}
