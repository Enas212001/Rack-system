import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Racks/models/rack_info_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> exportRackAsPdf(
  BuildContext context,
  String hotelName,
  List<RackInfoModel> racks,
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
              'Racks Report for ${hotelName[0].toUpperCase()}${hotelName.substring(1).toLowerCase()}',
              style: pw.TextStyle(
                fontSize: 16.sp,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.GridView(
            crossAxisCount: 2,
            childAspectRatio: 2,
            children: racks.map((rack) {
              return pw.Container(
                padding: const pw.EdgeInsets.all(8),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.grey),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('ID: ${rack.id}'),
                    pw.Text('Name: ${rack.deviceName}'),
                    pw.Text('Serial Number: ${rack.productSerial}'),
                    pw.Text('MAC Address: ${rack.productMac}'),
                    pw.Text('Model: ${rack.productModel}'),
                    pw.Text('Port: ${rack.productPort}'),
                    pw.Text('Site Name: ${rack.siteName}'),
                    pw.Text('Panel: ${rack.productPanal}'),
                    
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
