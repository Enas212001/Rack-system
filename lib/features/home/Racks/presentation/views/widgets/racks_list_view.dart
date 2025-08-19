import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/widget/custom_loading.dart';
import 'package:flutter_application_1/core/utils/widget/lost_connection.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/cubit/rack_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'rack_item.dart';

class RacksListView extends StatelessWidget {
  const RacksListView({
    super.key,
    required this.hotelModel,
    required this.buildingModel,
  });
  final HotelModel hotelModel;
  final BuildingModel buildingModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RackCubit, RackState>(
      builder: (context, state) {
        if (state is RacksLoading) {
          return SliverToBoxAdapter(child: const CustomLoading());
        } else if (state is RacksFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else if (state is RacksSuccess) {
          final racks = state.racks;
          if (racks.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Text(
                    'No racks available',
                    style: CustomTextStyles.text14W500Primary,
                  ),
                ),
              ),
            );
          }
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor, width: 1.r),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.r,
                        vertical: 12.r,
                      ),
                      width: double.infinity,
                      color: AppColors.backgroundColor,
                      child: Text(
                        'Rack Id',
                        style: CustomTextStyles.text14W500Primary,
                      ),
                    ),
                    Divider(height: 1, color: AppColors.borderColor),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: racks.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          RackItem(
                            rackInfoModel: racks[index],
                            buildingModel: buildingModel,
                          ),
                          if (index < racks.length - 1)
                            const Divider(
                              height: 1,
                              color: AppColors.borderColor,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Center(
            child: LostConnection(
              onTap: () => context.read<RackCubit>().getRacksInfo(
                buildingRId: buildingModel.buildingRId!,
              ),
            ),
          ),
        );
      },
    );
  }
}
