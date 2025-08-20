import 'package:flutter/material.dart';

import 'switch_guest_item.dart';

class SwitchBody extends StatelessWidget {
  const SwitchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return SwitchGuestItem();
      }, childCount: 10),
    );
  }
}
