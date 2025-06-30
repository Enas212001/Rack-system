import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/export_building_to_pdf_func.dart';
import 'package:flutter_application_1/features/home/Buildings/cubit/building_cubit.dart';
import 'package:flutter_application_1/features/home/widget/icon_with_text_bg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExportBuildingToPDF extends StatelessWidget {
  const ExportBuildingToPDF({super.key, required this.hotelName});
  final String hotelName;
  @override
  Widget build(BuildContext context) {
    return IconTextWithBG(
      text: 'Export',
      icon: Icons.file_upload_outlined,
      onTap: () {
        final cubit = context.read<BuildingCubit>();
        final state = cubit.state;
        if (state is BuildingSuccess) {
          exportBuildingsAsPdf(context, hotelName, state.buildings);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Cannot export: buildings not loaded')),
          );
        }
      },
    );
  }
}
