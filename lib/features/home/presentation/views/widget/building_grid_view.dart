import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'building_item.dart';

class BuildingGridView extends StatelessWidget {
  const BuildingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => GestureDetector(
          onTap: () {
            GoRouter.of(context).push('/racks');
          },
          child: BuildingItem(),
        ),
        childCount: 5,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),
    );
  }
}
