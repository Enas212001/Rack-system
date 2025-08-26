import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/custom_loading.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/rack_cubit/rack_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rack_guest_item.dart';

class RacksBody extends StatelessWidget {
  const RacksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RackCubit, RackState>(
      builder: (context, state) {
        if (state is RacksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return RackGuestItem(rackItem: state.racks[index]);
            }, childCount: state.racks.length),
          );
        } else if (state is RacksFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else if (state is RacksLoading) {
          return SliverToBoxAdapter(child: CustomLoading());
        }
        return SliverToBoxAdapter();
      },
    );
  }
}
