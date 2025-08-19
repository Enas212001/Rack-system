import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/top_with_back.dart';

import 'building_guest_item.dart';

class GuestBuildingViewBody extends StatelessWidget {
  const GuestBuildingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: TopWithBack(title: 'Building', text: 'Building'),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return BuildingGuestItem();
          }, childCount: 10),
        ),
      ],
    );
  }
}
