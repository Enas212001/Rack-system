import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/home/Racks/models/rack_info_model.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RockInfoTable extends StatefulWidget {
  const RockInfoTable({super.key, required this.rackInfoModel});
  final List<RackInfoModel> rackInfoModel;

  @override
  State<RockInfoTable> createState() => _RockInfoTableState();
}

class _RockInfoTableState extends State<RockInfoTable> {
  // Track expanded items
  final Set<int> _expandedIndices = {};

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.rackInfoModel.length,
        padding: EdgeInsets.all(16.r),
        separatorBuilder: (_, __) => SizedBox(height: 10.h),
        itemBuilder: (context, index) {
          final rack = widget.rackInfoModel[index];
          final isExpanded = _expandedIndices.contains(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  side: BorderSide(color: AppColors.borderColor, width: 1.r),
                ),
                leading: SvgPicture.asset(Assets.imagesDevice),
                minLeadingWidth: 10.w,
                title: Text('Device Name: ${rack.deviceName ?? 'N/A'}'),
                trailing: TextButton(
                  onPressed: () {
                    setState(() {
                      if (isExpanded) {
                        _expandedIndices.remove(index);
                      } else {
                        _expandedIndices.add(index);
                      }
                    });
                  },
                  child: Text(
                    isExpanded ? 'Hide Details' : 'View Details',
                    style: CustomTextStyles.text12RegularGrey.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              if (isExpanded)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.r,
                    vertical: 8.r,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _rackDetailRow('Serial Number', rack.productSerial),
                      _rackDetailRow('MAC Address', rack.productMac),
                      _rackDetailRow('Model', rack.productModel),
                      _rackDetailRow('Site Name', rack.siteName),
                      _rackDetailRow('Switch Port', rack.productPort),
                      _rackDetailRow('Patch Panel Port', rack.productPanal),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _rackDetailRow(String label, String? value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Text(
        '$label: ${value ?? 'N/A'}',
        style: TextStyle(fontSize: 12.sp),
      ),
    );
  }
}
