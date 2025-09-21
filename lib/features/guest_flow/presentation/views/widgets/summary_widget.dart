import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/container_decoration.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/widget/item_detail.dart';
import 'package:flutter_application_1/features/guest_flow/presentation/manager/cubit/summary_cubit.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_primary_16.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key, required this.switchItem});
  final SwitchItem switchItem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SummaryCubit()..getSummary(switchId: switchItem.id!.toString()),
      child: Padding(
        padding: EdgeInsets.all(12.h),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: containerDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text16MeduimPrimaryColor(text: 'Summary'),
              SizedBox(height: 16.h),
              BlocBuilder<SummaryCubit, SummaryState>(
                builder: (context, state) {
                  if (state is SummarySuccess) {
                    final summaries = state.summaries;
                    if (summaries.isEmpty) {
                      return const SizedBox();
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: summaries.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          padding: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          child: Column(
                            children: [
                              ItemDetail(
                                label: 'AP Room :',
                                value: summaries[index].apRoom.toString(),
                              ),
                              ItemDetail(
                                label: 'AP out :',
                                value: summaries[index].apOut.toString(),
                              ),
                              ItemDetail(
                                label: 'CCTV in :',
                                value: summaries[index].cctvIn.toString(),
                              ),
                              ItemDetail(
                                label: 'CCTV out :',
                                value: summaries[index].cctvOut.toString(),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
