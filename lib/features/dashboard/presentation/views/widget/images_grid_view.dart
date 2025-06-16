import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:go_router/go_router.dart';

class ImageGridView extends StatelessWidget {
  const ImageGridView({super.key});
  final List<String> imagePaths = const [
    Assets.imagesHotel1,
    Assets.imagesHotel2,
    Assets.imagesHotel3,
    Assets.imagesHotel4,
    Assets.imagesHotel5,
    Assets.imagesHotel6,
    Assets.imagesHotel7,
    Assets.imagesHotel8,
    Assets.imagesHotel9,
    Assets.imagesHotel10,
    Assets.imagesHotel1,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: imagePaths.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push('/building');
          },
          child: Image.asset(imagePaths[index]),
        );
      },
    );
  }
}
