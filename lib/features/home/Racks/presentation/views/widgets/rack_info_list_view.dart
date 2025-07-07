import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_info_model.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'rack_detail.dart';

class RockInfoListView extends StatefulWidget {
  const RockInfoListView({super.key, required this.rackInfoModel});
  final List<RackInfoModel> rackInfoModel;

  @override
  State<RockInfoListView> createState() => _RockInfoListViewState();
}

class _RockInfoListViewState extends State<RockInfoListView>
    with TickerProviderStateMixin {
  final Set<int> _expandedIndices = {};

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.rackInfoModel.length,
        padding: EdgeInsets.all(12.r),
        separatorBuilder: (_, __) => SizedBox(height: 8.h),
        itemBuilder: (context, index) {
          final rack = widget.rackInfoModel[index];
          final isExpanded = _expandedIndices.contains(index);
          return Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor, width: 1.r),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header Row with icon + toggle
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Assets.imagesDevice,
                      width: 16.w,
                      height: 16.h,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        'Device Name: ${rack.deviceName ?? 'N/A'}',
                        style: CustomTextStyles.text12RegularGrey.copyWith(
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded
                              ? _expandedIndices.remove(index)
                              : _expandedIndices.add(index);
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            isExpanded ? 'Hide Details' : 'View Details',
                            style: CustomTextStyles.text12RegularGrey.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_down_rounded
                                : Icons.keyboard_arrow_right_rounded,
                            size: 18.sp,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                /// Details section with vertical animation
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: Alignment.centerLeft,
                  child: isExpanded
                      ? Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RackItemDetail(
                                label: 'Serial Number',
                                value: rack.productSerial,
                              ),
                              RackItemDetail(
                                label: 'MAC Address',
                                value: rack.productMac,
                              ),
                              RackItemDetail(
                                label: 'Site Name',
                                value: rack.siteName,
                              ),
                              RackItemDetail(
                                label: 'Model',
                                value: rack.productModel,
                              ),
                              RackItemDetail(
                                label: 'Switch Port',
                                value: rack.productPort,
                              ),
                              RackItemDetail(
                                label: 'Patch Panel Port',
                                value: rack.productPanal,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
