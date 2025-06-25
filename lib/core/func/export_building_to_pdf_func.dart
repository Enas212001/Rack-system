import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Buildings/models/building_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> exportBuildingsAsPdf(
  BuildContext context,
  String hotelName,
  List<BuildingModel> buildings,
) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.Header(
            level: 0,
            child: pw.Text(
              'Buildings Report for ${hotelName[0].toUpperCase()}${hotelName.substring(1).toLowerCase()}',
            ),
          ),
          pw.GridView(
            crossAxisCount: 2,
            childAspectRatio: 2,
            children: buildings.map((building) {
              return pw.Container(
                padding: const pw.EdgeInsets.all(8),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.grey),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('ID: ${building.id}'),
                    pw.Text('Name: ${building.buildingName}'),
                    // Add more fields as needed
                  ],
                ),
              );
            }).toList(),
          ),
        ];
      },
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
