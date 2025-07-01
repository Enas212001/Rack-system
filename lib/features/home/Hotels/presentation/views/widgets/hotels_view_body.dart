import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/features/home/Hotels/cubit/hotel_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_client_widget.dart';
import 'hotels_list_view.dart';
import 'top_widget.dart';
import 'user_info.dart';

class HotelsViewBody extends StatelessWidget {
  const HotelsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelCubit = context.read<HotelCubit>();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: TopWidget(
            widget: Image.asset(Assets.imagesWhiteLogo),
            text: 'Hotel',
            onSearchChanged: hotelCubit.searchHotels,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                const UserInfo(),
                SizedBox(height: 16.h),
                const AddClientWidget(),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          sliver: HotelsSliverListView(), // this is custom below
        ),
      ],
    );
  }
}
