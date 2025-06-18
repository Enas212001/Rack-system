import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ImageGridView extends StatelessWidget {
  const ImageGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeFailure) {
          return Center(child: Text(state.message));
        } else if (state is HomeSuccess) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.buildings.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              childAspectRatio: 2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push('/building');
                },
                child:
                    //  Image.network(
                    //   state.buildings[index].logo!,
                    //   errorBuilder: (context, error, stackTrace) =>
                    //       const Icon(Icons.error),
                    // ),
                    Center(
                      child: Text(
                        state.buildings[index].name ?? 'No Name',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
