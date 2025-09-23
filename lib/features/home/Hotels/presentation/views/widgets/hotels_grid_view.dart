import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/core/widget/empty_widget.dart';
import 'package:flutter_application_1/core/widget/lost_connection.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/cubit/hotel_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'hotel_item.dart';

class HotelsSliverGridView extends StatelessWidget {
  const HotelsSliverGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HotelCubit, HotelState>(
      listener: (context, state) {
        if (state is DeleteHotelSuccess) {
          context.read<HotelCubit>().getHotels();
        } else if (state is DeleteHotelFailure) {
          showToast(state.message);
        }
      },
      child: BlocBuilder<HotelCubit, HotelState>(
        builder: (context, state) {
          if (state is HotelLoading) {
            return const SliverToBoxAdapter(child: CustomLoading());
          } else if (state is HotelFailure) {
            return SliverFillRemaining(
              child: Center(
                child:
                    state.message == 'Connection timed out. Please try again.'
                    ? LostConnection()
                    : Text(state.message),
              ),
            );
          } else if (state is HotelSuccess) {
            final hotels = state.hotels;
            if (hotels.isEmpty) {
              return const SliverFillRemaining(
                child: EmptyWidget(text: 'Hotels'),
              );
            }
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
          } else if (state is DeleteHotelLoading) {
            return const SliverToBoxAdapter(child: CustomLoading());
          }
          return const SliverToBoxAdapter(
            child: Center(child: Center(child: Text('Something went wrong'))),
          );
        },
      ),
    );
  }
}
