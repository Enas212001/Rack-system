import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/top_with_back.dart';

import 'device_body.dart';
import 'guest_tap_bar.dart';
import 'rack_body.dart';
import 'switch_body.dart';

class GuestRackViewBody extends StatefulWidget {
  const GuestRackViewBody({super.key});

  @override
  State<GuestRackViewBody> createState() => _GuestRackViewBodyState();
}

class _GuestRackViewBodyState extends State<GuestRackViewBody> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: TopWithBack(text: 'Welcome, ...', noSearch: true),
        ),
        SliverToBoxAdapter(
          child: GuestRackTapBar(
            selectedIndex: selectedIndex,
            onIndexChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
        buildRacks(selectedIndex),
      ],
    );
  }

  Widget buildRacks(int index) {
    switch (index) {
      case 0:
        return RacksBody();
      case 1:
        return SwitchBody();
      case 2:
        return DeviceBody();
      default:
        return const SliverToBoxAdapter();
    }
  }
}
