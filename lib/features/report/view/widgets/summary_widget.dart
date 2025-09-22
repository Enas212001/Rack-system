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
        child: BlocBuilder<SummaryCubit, SummaryState>(
          builder: (context, state) {
            if (state is SummarySuccess) {
              final summaries = state.summaries;
              if (summaries.isEmpty) {
                return const SummaryItem(
                  summaryId: '',
                  apRoom: '0',
                  apOut: '0',
                  cctvIn: '0',
                  cctvOut: '0',
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: summaries.length,
                itemBuilder: (context, index) {
                  return SummaryItem(
                    summaryId: summaries[index].id.toString(),
                    apRoom: summaries[index].apRoom.toString(),
                    apOut: summaries[index].apOut.toString(),
                    cctvIn: summaries[index].cctvIn.toString(),
                    cctvOut: summaries[index].cctvOut.toString(),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.apRoom,
    required this.apOut,
    required this.cctvIn,
    required this.cctvOut,
    required this.summaryId,
  });
  final String apRoom, apOut, cctvIn, cctvOut, summaryId;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: containerDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16MeduimPrimaryColor(text: 'Summary $summaryId'),
          SizedBox(height: 16.h),
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.borderColor),
            ),
            child: Column(
              children: [
                ItemDetail(label: 'AP Room :', value: apRoom),
                ItemDetail(label: 'AP out :', value: apOut),
                ItemDetail(label: 'CCTV in :', value: cctvIn),
                ItemDetail(label: 'CCTV out :', value: cctvOut),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
