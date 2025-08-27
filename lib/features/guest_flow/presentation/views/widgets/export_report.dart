import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/export_switch_excel.dart';
import 'package:flutter_application_1/core/func/export_switch_pdf.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/widget/custom_button.dart';
import 'package:flutter_application_1/features/guest_flow/presentation/manager/cubit/summary_cubit.dart';
import 'package:flutter_application_1/features/guest_flow/presentation/views/widgets/text_primary_16.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExportSwitchInfo extends StatelessWidget {
  const ExportSwitchInfo({super.key, required this.switchItem});

  final SwitchItem switchItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    SummaryCubit()
                      ..getSummary(switchId: switchItem.id.toString()),
              ),
              BlocProvider(
                create: (context) =>
                    DeviceCubit()
                      ..getDevices(switchId: switchItem.id.toString()),
              ),
            ],
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 320.w,
                  padding: EdgeInsets.all(24.r),
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 16,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Are you want to export switch info ?',
                        style: CustomTextStyles.text16MeduimText,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 25.h),
                      BlocBuilder<SummaryCubit, SummaryState>(
                        builder: (context, summaryState) {
                          return BlocBuilder<DeviceCubit, DeviceState>(
                            builder: (context, deviceState) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      text: 'Export excel',
                                      isPrimary: false,
                                      onPressed: () {
                                        if (summaryState is SummarySuccess &&
                                            deviceState is DeviceSuccess) {
                                          generateSingleSheetExcel(
                                            switchItem: switchItem,
                                            summaries: summaryState.summaries,
                                            devices: deviceState.devices,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: CustomButton(
                                      text: 'Export pdf',
                                      isPrimary: true,
                                      onPressed: () {
                                        if (summaryState is SummarySuccess &&
                                            deviceState is DeviceSuccess) {
                                          previewStyledPdf(
                                            switchItem,
                                            summaryState.summaries,
                                            deviceState.devices,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: Text16MeduimPrimaryColor(text: 'Export'),
    );
  }
}
