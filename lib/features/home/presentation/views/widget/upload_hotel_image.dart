import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/features/home/presentation/manager/cubit/hotel_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadHotelImage extends StatelessWidget {
  const UploadHotelImage({super.key});

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    return Column(
      children: [
        SizedBox(height: 10.h),
        Text(
          'Logo image',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade100,
                ),
                child: const Center(child: Text("Tap to choose an image")),
              ),
            );
          },
        ),
      ],
    );
  }
}
