import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';

import 'guest_view_item.dart';
import 'switch_guest_item_details.dart';

class SwitchGuestItem extends StatelessWidget {
  const SwitchGuestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GuestViewItem(
      image: Assets.imagesSwitchGuest,
      title: 'Switch Name',
      widget: SwitchGuestItemDetails(),
    );
  }
}
