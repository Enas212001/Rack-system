import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddClientWidget extends StatelessWidget {
  const AddClientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Our Clients', style: Theme.of(context).textTheme.titleMedium),
        Spacer(),
        Row(
          children: [
            Container(
              color: Colors.black,
              width: 86.w,
              height: 19.h,
              alignment: Alignment.center,
              child: Text(
                '+Add User',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(width: 5.w),
            Image.asset(Assets.imagesAddIcon),
          ],
        ),
      ],
    );
  }
}
