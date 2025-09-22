import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/widget/delete_widget.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Hotels/presentation/cubit/hotel_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HotelItem extends StatelessWidget {
  const HotelItem({super.key, required this.hotel});
  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        height: 135.h,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: NetworkImage(
                    '${Endpoints.baseUrlImage}/${hotel.logo?.trim()}',
                  ),
                  onError: (exception, stackTrace) => const Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Row(
                children: [
                  SizedBox(
                    width: 120.w,
                    child: Text(
                      hotel.name![0].toUpperCase() +
                          hotel.name!.substring(1).toLowerCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.text14Regular.copyWith(
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      await GoRouter.of(
                        context,
                      ).push(AppRoutes.editHotel, extra: hotel);
                      context.read<HotelCubit>().getHotels();
                    },
                    child: SvgPicture.asset(Assets.imagesEdit),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) => DeleteWidget(
                          onDelete: () {
                            Navigator.pop(context);
                            context.read<HotelCubit>().deleteHotel(
                              hotel: hotel,
                            );
                          },
                          title: 'Hotel',
                        ),
                      );
                    },
                    child: SvgPicture.asset(Assets.imagesDelete),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
