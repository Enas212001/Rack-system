import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_model/rack_item.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RackSwitchDetails extends StatelessWidget {
  const RackSwitchDetails({super.key, required this.rackInfoModel});

  final RackItem rackInfoModel;

  @override
  Widget build(BuildContext context) {
    return Center(
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
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 110.w,
                    child: Text(
                      'Rack Switchs: ',
                      style: CustomTextStyles.text14W500Primary,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        rackInfoModel.switches
                            ?.map(
                              (s) => Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: Text(
                                  s.name ?? '',
                                  style: CustomTextStyles.text12RegularGrey,
                                ),
                              ),
                            )
                            .toList() ??
                        [],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
