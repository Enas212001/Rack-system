import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/custom_loading.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/switch_cubit/switch_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'switch_guest_item.dart';

class SwitchBody extends StatelessWidget {
  const SwitchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        if (state is SwitchSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return SwitchGuestItem(switchItem: state.switches[index]);
            }, childCount: state.switches.length),
          );
        } else if (state is SwitchFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else if (state is SwitchLoading) {
          return SliverToBoxAdapter(child: CustomLoading());
        }
        return SliverToBoxAdapter();
      },
    );
  }
}
