import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_show_dialog.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/widget/add_full_button.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/core/widget/success_message.dart';
import 'package:flutter_application_1/core/widget/upload_hotel_image.dart';
import 'package:flutter_application_1/features/auth/presentation/views/widgets/title_with_textfield.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/cubit/hotel_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditHotelForm extends StatelessWidget {
  const EditHotelForm({super.key, required this.hotel});
  final HotelModel hotel;
  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        if (state is EditHotelSuccess) {
          hotelCubit.getHotels();
          Navigator.pop(context);
          customShowDialog(
            context,
            widget: SuccessMessage(messageName: AppStrings.hotel, isEdit: true),
          );
        } else if (state is EditHotelFailure) {
          log(state.message);
          showToast('Failed to add Hotel');
        } else if (state is EditHotelLoading) {
          CustomLoading();
        }
      },
      builder: (context, state) {
        return Form(
          key: hotelCubit.formEditHotelKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Edit Hotel', style: CustomTextStyles.text14W500Primary),
                SizedBox(height: 20.h),
                TitleWithTextField(
                  title: 'Hotel Name',
                  value: hotel.name,
                  onChanged: (value) =>
                      hotelCubit.hotelNameEditController.text = value,
                ),
                SizedBox(height: 10.h),
                TitleWithTextField(
                  title: 'Buildings Count',
                  value: hotel.buildingId.toString(),
                  onChanged: (value) =>
                      hotelCubit.buildingNumberEditController.text = value,
                ),
                UploadHotelImage(
                  currentImageUrl:
                      '${Endpoints.baseUrlImage}/${hotel.logo?.trim()}',
                ),
                SizedBox(height: 20.h),
                AddFullSizeButton(
                  onPressed: () {
                    if (hotelCubit.formEditHotelKey.currentState!.validate()) {
                      hotelCubit.editHotel(hotel: hotel);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
