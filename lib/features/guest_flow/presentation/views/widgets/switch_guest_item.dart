import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';

import 'guest_view_item.dart';
import 'switch_guest_item_details.dart';

class SwitchGuestItem extends StatelessWidget {
  const SwitchGuestItem({super.key, required this.switchItem});
  final SwitchItem switchItem;

  @override
  Widget build(BuildContext context) {
    return GuestViewItem(
      image: Assets.imagesSwitchGuest,
      title: switchItem.name!,
      widget: SwitchGuestItemDetails(switchItem: switchItem),
    );
  }
}
