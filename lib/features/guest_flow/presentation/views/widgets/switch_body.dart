import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/widget/empty_widget.dart';
import 'package:flutter_application_1/core/widget/lost_connection.dart';
import 'package:flutter_application_1/core/widget/shimmer_widget.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/switch_cubit/switch_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'switch_guest_item.dart';

class SwitchBody extends StatelessWidget {
  const SwitchBody({
    super.key,
    // this.onTap
  });
  // final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        if (state is SwitchSuccess) {
          if (state.switches.isEmpty) {
            return SliverFillRemaining(
              child: const EmptyWidget(text: 'Switches'),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return GestureDetector(
                onTap: () {
                  // onTap!();
                  context.push(
                    AppRoutes.guestDevice,
                    extra: state.switches[index],
                  );
                },
                child: SwitchGuestItem(switchItem: state.switches[index]),
              );
            }, childCount: state.switches.length),
          );
        } else if (state is SwitchFailure) {
          return SliverFillRemaining(
            child: Center(
              child: state.message == 'Connection timed out. Please try again.'
                  ? LostConnection()
                  : Text(state.message),
            ),
          );
        } else if (state is SwitchLoading) {
          return ShimmerWidget(height: 275);
        }
        return SliverToBoxAdapter();
      },
    );
  }
}
