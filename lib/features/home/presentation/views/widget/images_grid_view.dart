import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ImageGridView extends StatelessWidget {
  const ImageGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HotelLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HotelFailure) {
          return Center(child: Text(state.message));
        } else if (state is HotelSuccess) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.hotels.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              childAspectRatio: 2,
            ),
            itemBuilder: (context, index) {
              final hotel = state.hotels[index];
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<HomeCubit>(
                    context,
                  ).getBuildings(hotelId: hotel.id!);
                  GoRouter.of(context).push('/building', extra: hotel);
                },
                child: Image.network(
                  '${Endpoints.baseUrlImage}/${hotel.logo?.trim()}',
                  errorBuilder: (context, error, stackTrace) {
                    log('Image error: $error'); // Log the exact issue
                    return const Icon(Icons.error);
                  },
                ),
              );
            },
          );
        }
        return const Center(child: Text('No data available'));
      },
    );
  }
}
