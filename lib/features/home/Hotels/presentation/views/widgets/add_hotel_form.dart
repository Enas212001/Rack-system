import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/Hotels/cubit/hotel_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/add_full_button.dart';
import '../../../../widget/upload_hotel_image.dart';

class AddHotelForm extends StatelessWidget {
  const AddHotelForm({super.key});
  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        if (state is AddHotelSuccess) {
          showToast('Hotel added successfully');
          hotelCubit.getHotels();
          Navigator.pop(context);
        } else if (state is AddHotelFailure) {
          log(state.message);
          showToast('Failed to add Hotel');
        } else if (state is AddHotelLoading) {
          showToast('Loading...');
        }
      },
      builder: (context, state) {
        return Form(
          key: hotelCubit.formAddHotelKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Add New Hotel', style: CustomTextStyles.text20Bold),
                SizedBox(height: 20.h),
                TitleWithTextField(
                  title: 'Hotel Name',
                  controller: hotelCubit.hotelNameController,
                  hintText: 'Enter Hotel Name',
                ),
                SizedBox(height: 10.h),
                TitleWithTextField(
                  title: 'Building Number',
                  controller: hotelCubit.buildingNumberController,
                  hintText: 'e.g R1, Tower -3',
                ),
                UploadHotelImage(),
                SizedBox(height: 20.h),
                AddFullSizeButton(
                  onPressed: () {
                    if (hotelCubit.formAddHotelKey.currentState!.validate()) {
                      hotelCubit.addHotel();
                    }
                  },
                  text: 'Add Hotel',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
