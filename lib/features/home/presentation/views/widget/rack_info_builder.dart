import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/manager/cubit/rack_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rack_info_table.dart';

class RackInfoBuilder extends StatelessWidget {
  const RackInfoBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RackCubit()..getRacksInfo(),
      child: BlocBuilder<RackCubit, RackState>(
        builder: (context, state) {
          if (state is RacksLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RacksSuccess) {
            return RockInfoTable(rackInfoModel: state.racks);
          } else if (state is RacksFailure) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
