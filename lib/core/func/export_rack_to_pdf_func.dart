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
          pw.Table(
            border: pw.TableBorder.all(color: PdfColors.black),
            children: [
              // Header row
              pw.TableRow(
                decoration: const pw.BoxDecoration(color: PdfColors.blue),
                children: [
                  _pdfCell('DEVICE NAME', bold: true, color: PdfColors.white),
                  _pdfCell('SERIAL NUMBER', bold: true, color: PdfColors.white),
                  _pdfCell('MAC ADDRESS', bold: true, color: PdfColors.white),
                  _pdfCell('MODEL', bold: true, color: PdfColors.white),
                  _pdfCell('SITE NAME', bold: true, color: PdfColors.white),
                  _pdfCell('SWITCH PORT', bold: true, color: PdfColors.white),
                  _pdfCell(
                    'PATCH PANEL PORT',
                    bold: true,
                    color: PdfColors.white,
                  ),
                ],
              ),
              ...racks.map(
                (rack) => pw.TableRow(
                  children: [
                    _pdfCell(rack.deviceName),
                    _pdfCell(rack.productSerial),
                    _pdfCell(rack.productMac),
                    _pdfCell(rack.productModel),
                    _pdfCell(rack.siteName),
                    _pdfCell(rack.productPort),
                    _pdfCell(rack.productPanal),
                  ],
                ),
              ),
            ],
          ),
        ];
      },
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}

pw.Widget _pdfCell(String? text, {bool bold = false, PdfColor? color}) {
  return pw.Container(
    padding: pw.EdgeInsets.all(4.r),
    child: pw.Text(
      text ?? '',
      style: pw.TextStyle(
        fontSize: 9.sp,
        fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
        color: color ?? PdfColors.black,
      ),
    ),
  );
}
