import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/summary_model/summary_item.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

Future<void> generateStyledExcel({
  required SwitchItem switchItem,
  required List<SummaryItem> summaries,
  required List<DeviceItem> devices,
}) async {
  final excel = Excel.createExcel();

  // ===== Define header style =====
  final headerStyle = CellStyle(
    bold: true,
    backgroundColorHex: ExcelColor.fromHexString('#FFFF00'),
    fontColorHex: ExcelColor.fromHexString('#000000'),
    horizontalAlign: HorizontalAlign.Center,
    verticalAlign: VerticalAlign.Center,
  );

  // ===== Summary Sheet =====
  final summarySheet = excel['Summary'];
  summarySheet.appendRow([TextCellValue("Summary"), TextCellValue("Value")]);
  summarySheet.row(0).forEach((cell) {
    if (cell != null) cell.cellStyle = headerStyle;
  });

  summarySheet.appendRow([
    TextCellValue("AP Room"),
    TextCellValue(
      (summaries.isNotEmpty ? summaries[0].apRoom.toString() : "0"),
    ),
  ]);
  summarySheet.appendRow([
    TextCellValue("AP Out"),
    TextCellValue((summaries.isNotEmpty ? summaries[0].apOut.toString() : "0")),
  ]);
  summarySheet.appendRow([
    TextCellValue("CCTV in"),
    TextCellValue(
      (summaries.isNotEmpty ? summaries[0].cctvIn.toString() : "0"),
    ),
  ]);
  summarySheet.appendRow([
    TextCellValue("CCTV out"),
    TextCellValue(
      (summaries.isNotEmpty ? summaries[0].cctvOut.toString() : "0"),
    ),
  ]);

  // ===== Switch Info Sheet =====
  final switchSheet = excel['Switch Info'];
  switchSheet.appendRow([
    TextCellValue('DEVICE NAME'),
    TextCellValue('SERIAL NUMBER'),
    TextCellValue('MAC ADDRESS'),
    TextCellValue('IP ADDRESS'),
    TextCellValue('MODEL'),
    TextCellValue('Uplink Port for Core 1'),
    TextCellValue('Uplink Port for Core 2'),
  ]);
  switchSheet.row(0).forEach((cell) {
    if (cell != null) cell.cellStyle = headerStyle;
  });

  switchSheet.appendRow([
    TextCellValue(switchItem.name ?? ''),
    TextCellValue(switchItem.serialNumber ?? ''),
    TextCellValue(switchItem.macAdd ?? ''),
    TextCellValue(switchItem.ipAdd ?? ''),
    TextCellValue(switchItem.model ?? ''),
    TextCellValue(switchItem.upLinkCore1?.toString() ?? ''),
    TextCellValue(switchItem.upLinkCore2?.toString() ?? ''),
  ]);

  // ===== Devices Sheet =====
  final deviceSheet = excel['Devices'];
  deviceSheet.appendRow([
    TextCellValue('DEVICE NAME'),
    TextCellValue('SERIAL NUMBER'),
    TextCellValue('MAC ADDRESS'),
    TextCellValue('MODEL'),
    TextCellValue('Switch Port'),
    TextCellValue('Patch Panel Port'),
  ]);
  deviceSheet.row(0).forEach((cell) {
    if (cell != null) cell.cellStyle = headerStyle;
  });

  for (var d in devices) {
    deviceSheet.appendRow([
      TextCellValue(d.deviceName ?? ''),
      TextCellValue(d.deviceSerial ?? ''),
      TextCellValue(d.macAddress ?? ''),
      TextCellValue(d.deviceModel ?? ''),
      TextCellValue(d.portNumber?.toString() ?? ''),
      TextCellValue(d.patchPanel ?? ''),
    ]);
  }

  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/switch_report.xlsx');
  await file.writeAsBytes(excel.encode()!);

  print('✅ Excel exported to: ${file.path}');

  // 👉 Open Excel file in external viewer
  await OpenFilex.open(file.path);
}
