import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widgets/custom_loading.dart';
import 'package:flutter_application_1/core/utils/widgets/lost_connection.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/cubit/hotel_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'hotel_item.dart';

class HotelsSliverGridView extends StatelessWidget {
  const HotelsSliverGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        if (state is HotelLoading) {
          return const SliverToBoxAdapter(child: CustomLoading());
        } else if (state is HotelFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else if (state is HotelSuccess) {
          final hotels = state.hotels;
          return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.w,
              childAspectRatio: 1.1,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final hotel = hotels[index];
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.building, extra: hotel);
                },
                child: HotelItem(hotel: hotel),
              );
            }, childCount: hotels.length),
          );
        }
        return SliverToBoxAdapter(
          child: Center(
            child: LostConnection(
              onTap: () => context.read<HotelCubit>().getHotels(),
            ),
          ),
        );
      },
    );
  }
}
