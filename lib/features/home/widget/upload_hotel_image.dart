import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/home/Hotels/cubit/hotel_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadHotelImage extends StatelessWidget {
  const UploadHotelImage({super.key});

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text(
          'Logo image',
          style: CustomTextStyles.text12RegularGrey.copyWith(
            color: AppColors.textColor,
          ),
        ),
        SizedBox(height: 8.h),
        BlocConsumer<HotelCubit, HotelState>(
          listener: (context, state) {
            if (state is PickHotelFromGallerySuccess) {
              showToast('Image picked successfully');
            } else if (state is PickHotelFromGalleryFailure) {
              showToast(state.message);
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () async {
                await hotelCubit.pickImageWithGallery();
              },
              child: Container(
                padding: EdgeInsets.all(8.r),
                width: double.infinity,
                height: 75.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade100,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      color: AppColors.greyColor,
                    ),
                    Text(
                      "Upload image",
                      style: CustomTextStyles.text12RegularGrey,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
