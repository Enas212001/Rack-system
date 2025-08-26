import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/features/guest_flow/presentation/views/widgets/rack_guest_item_details.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_model/rack_item.dart';

import 'guest_view_item.dart';

class RackGuestItem extends StatelessWidget {
  const RackGuestItem({super.key, required this.rackItem});
  final RackItem rackItem;
  @override
  Widget build(BuildContext context) {
    return GuestViewItem(
      image: Assets.imagesRackGuest,
      title: rackItem.rackName!,
      widget: RackGuestItemDetails(rackItem: rackItem),
    );
  }
}
