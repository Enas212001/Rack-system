import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/custom_toast.dart';
import 'package:flutter_application_1/core/func/export_rack_to_pdf_func.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/cubit/rack_cubit.dart';
import 'package:flutter_application_1/features/home/widget/icon_with_text_bg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExportRackToPDF extends StatelessWidget {
  const ExportRackToPDF({super.key, required this.hotelName});
  final String hotelName;

  @override
  Widget build(BuildContext context) {
    return ExportIcon(
      text: AppStrings.export,
      icon: Icons.file_upload_outlined,
      onTap: () {
        final cubit = context.read<RackCubit>();
        final state = cubit.state;
        if (state is RacksSuccess) {
          exportRackAsPdf(context, hotelName, state.racks);
        } else {
          showToast( AppStrings.notExportRacks);
        }
      },
    );
  }
}
