import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widgets/custom_loading.dart';
import 'package:flutter_application_1/features/home/Racks/cubit/rack_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rack_info_list_view.dart';

class RackInfoBuilder extends StatelessWidget {
  const RackInfoBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RackCubit, RackState>(
      builder: (context, state) {
        if (state is RacksLoading) {
          return const CustomLoading();
        } else if (state is RacksSuccess) {
          return RockInfoListView(rackInfoModel: state.racks);
        } else if (state is RacksFailure) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
