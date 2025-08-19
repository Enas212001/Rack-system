import 'package:flutter/material.dart';

import 'rack_guest_item.dart';

class RacksBody extends StatelessWidget {
  const RacksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return RackGuestItem();
      }, childCount: 10),
    );
  }
}
