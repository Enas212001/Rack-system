import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/cubit/hotel_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class UploadHotelImage extends StatefulWidget {
  const UploadHotelImage({super.key});

  @override
  State<UploadHotelImage> createState() => _UploadHotelImageState();
}

class _UploadHotelImageState extends State<UploadHotelImage> {
  File? selectedImage;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final cubit = context.read<HotelCubit>();
      cubit.imageFromGallery = XFile(picked.path);
      setState(() {
        selectedImage = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text(
          AppStrings.logoImage,
          style: CustomTextStyles.text12RegularGrey.copyWith(
            color: AppColors.textColor,
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: _pickImage,
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              radius: Radius.circular(4.r),
              color: AppColors.borderColor,
            ),
            child: Container(
              padding: EdgeInsets.all(8.r),
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.grey.shade100,
              ),
              child: selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        selectedImage!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_upload_outlined,
                          color: AppColors.greyColor,
                        ),
                        Text(
                          AppStrings.uploadImage,
                          style: CustomTextStyles.text12RegularGrey,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
