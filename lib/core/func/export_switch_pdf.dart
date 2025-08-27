import 'package:flutter/services.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/summary_model/summary_item.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<pw.Document> exportSwitchAsPdf({
  required SwitchItem switchItem,
  required List<SummaryItem> summaries,
  required List<DeviceItem> devices,
}) async {
  final pdf = pw.Document();

  // Load logo (put your logo in assets/logo.png and register in pubspec.yaml)
  final logoImage = pw.MemoryImage(
    (await rootBundle.load(
      'assets/images/PowerSMTPLogo.png',
    )).buffer.asUint8List(),
  );

  // Colors & Styles
  final yellowHeader = PdfColors.yellow;

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Image(logoImage, height: 60),
              pw.Text(
                'Report for ${switchItem.name}',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              // Summary box
              pw.Container(
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                ),
                child: pw.TableHelper.fromTextArray(
                  headers: ['Summary', ''],
                  headerDecoration: pw.BoxDecoration(color: yellowHeader),
                  data: [
                    [
                      'AP Room',
                      summaries.isNotEmpty
                          ? summaries[0].apRoom.toString()
                          : '0',
                    ],
                    [
                      'AP Out',
                      summaries.isNotEmpty
                          ? summaries[0].apOut.toString()
                          : '0',
                    ],
                    [
                      'CCTV in',
                      summaries.isNotEmpty
                          ? summaries[0].cctvIn.toString()
                          : '0',
                    ],
                    [
                      'CCTV out',
                      summaries.isNotEmpty
                          ? summaries[0].cctvOut.toString()
                          : '0',
                    ],
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 20),
          pw.TableHelper.fromTextArray(
            headers: [
              'DEVICE NAME',
              'SERIAL NUMBER',
              'MAC ADDRESS',
              'IP ADDRESS',
              'MODEL',
              'Uplink Port for Core 1',
              'Uplink Port for Core 2',
            ],
            headerDecoration: pw.BoxDecoration(color: yellowHeader),
            data: [
              [
                switchItem.name ?? '',
                switchItem.serialNumber ?? '',
                switchItem.macAdd ?? '',
                switchItem.ipAdd ?? '',
                switchItem.model ?? '',
                switchItem.upLinkCore1?.toString() ?? '',
                switchItem.upLinkCore2?.toString() ?? '',
              ],
            ],
          ),
          pw.SizedBox(height: 20.h),

          // Devices Connected
          pw.TableHelper.fromTextArray(
            headers: [
              'DEVICE NAME',
              'SERIAL NUMBER',
              'MAC ADDRESS',
              'MODEL',
              'Switch Port',
              'Patch Panel Port',
            ],
            headerDecoration: pw.BoxDecoration(color: yellowHeader),
            data: devices
                .map(
                  (d) => [
                    d.deviceName ?? '',
                    d.deviceSerial ?? '',
                    d.macAddress ?? '',
                    d.deviceModel ?? '',
                    d.portNumber?.toString() ?? '',
                    d.patchPanel ?? '',
                  ],
                )
                .toList(),
          ),
        ];
      },
    ),
  );

  return pdf;
}

Future<void> previewStyledPdf(
  SwitchItem switchItem,
  List<SummaryItem> summaries,
  List<DeviceItem> devices,
) async {
  await Printing.layoutPdf(
    onLayout: (format) => exportSwitchAsPdf(
      switchItem: switchItem,
      summaries: summaries,
      devices: devices,
    ).then((pdf) => pdf.save()),
  );
}
