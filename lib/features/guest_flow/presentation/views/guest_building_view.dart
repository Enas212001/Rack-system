import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/guest_drawer.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/service/service_locator.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/cubit/building_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/guest_building_view_body.dart';

class GuestBuildingView extends StatelessWidget {
  const GuestBuildingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GuestDrawer(),
      body: BlocProvider(
        create: (context) => BuildingCubit()
          ..getBuildings(
            hotelId: getIt
                .get<CacheHelper>()
                .getData(key: CacheKey.userHotelId)
                .toString(),
          ),
        child: GuestBuildingViewBody(),
      ),
    );
  }
}
