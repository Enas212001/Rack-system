import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/features/guest_flow/presentation/views/widgets/guest_item_details.dart';
import 'package:flutter_application_1/features/guest_flow/presentation/views/widgets/guest_view_item.dart';
import 'package:go_router/go_router.dart';

class BuildingGuestItem extends StatelessWidget {
  const BuildingGuestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.guestRack);
      },
      child: GuestViewItem(
        image: Assets.imagesBuildingGuest,
        title: 'Building Name',
        widget: GuestViewItemDetails(),
      ),
    );
  }
}
