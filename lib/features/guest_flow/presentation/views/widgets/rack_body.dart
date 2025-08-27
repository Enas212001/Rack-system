import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/lost_connection.dart';
import 'package:flutter_application_1/core/utils/widget/shimmer_widget.dart';
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
          return SliverFillRemaining(
            child: Center(
              child: state.message == 'Connection timed out. Please try again.'
                  ? LostConnection()
                  : Text(state.message),
            ),
          );
        } else if (state is RacksLoading) {
          return ShimmerWidget(height: 165);
        }
        return SliverToBoxAdapter();
      },
    );
  }
}
