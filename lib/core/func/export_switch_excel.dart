import 'dart:io';
import 'package:excel/excel.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/summary_model/summary_item.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';

Future<void> generateSingleSheetExcel({
  required SwitchItem switchItem,
  required List<SummaryItem> summaries,
  required List<DeviceItem> devices,
}) async {
  final excel = Excel.createExcel();
  final sheet = excel['Report']; // this reuses "Sheet1" but renames it
  excel.rename('Sheet1', 'Report');

  final headerStyle = CellStyle(
    bold: true,
    backgroundColorHex: ExcelColor.fromHexString("#FFFF00"),
    fontColorHex: ExcelColor.fromHexString("#000000"),
    horizontalAlign: HorizontalAlign.Center,
    verticalAlign: VerticalAlign.Center,
    fontSize: 8,
  );

  // ===== Title =====
  sheet.appendRow([TextCellValue("${switchItem.name}")]);
  sheet.merge(CellIndex.indexByString("A1"), CellIndex.indexByString("G1"));
  // ===== Summary Section =====
  sheet.appendRow([]); // empty row

  // Title row
  sheet.appendRow([TextCellValue("Summary")]);
  final lastRowIndex = sheet.maxRows - 1;
  final summaryColumns = 1 + summaries.length; // 1 for "name" + N for values

  sheet.merge(
    CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: lastRowIndex),
    CellIndex.indexByColumnRow(
      columnIndex: summaryColumns,
      rowIndex: lastRowIndex,
    ),
  );

  sheet.row(sheet.maxRows - 1).forEach((c) => c?.cellStyle = headerStyle);

  // Prepare rows for each field (CellValue list, not Data)
  List<CellValue?> apRoomRow = [TextCellValue("AP Room")];
  List<CellValue?> apOutRow = [TextCellValue("AP Out")];
  List<CellValue?> cctvInRow = [TextCellValue("CCTV In")];
  List<CellValue?> cctvOutRow = [TextCellValue("CCTV Out")];

  // Fill them with values from all summaries
  for (var summary in summaries) {
    apRoomRow.add(TextCellValue(summary.apRoom?.toString() ?? "0"));
    apOutRow.add(TextCellValue(summary.apOut?.toString() ?? "0"));
    cctvInRow.add(TextCellValue(summary.cctvIn?.toString() ?? "0"));
    cctvOutRow.add(TextCellValue(summary.cctvOut?.toString() ?? "0"));
  }

  // Append rows
  sheet.appendRow(apRoomRow);
  sheet.appendRow(apOutRow);
  sheet.appendRow(cctvInRow);
  sheet.appendRow(cctvOutRow);

  // ===== Switch Info Section =====
  sheet.appendRow([]); // empty row
  sheet.appendRow([
    TextCellValue("DEVICE NAME"),
    TextCellValue("SERIAL NUMBER"),
    TextCellValue("MAC ADDRESS"),
    TextCellValue("IP ADDRESS"),
    TextCellValue("MODEL"),
    TextCellValue("Uplink Port for Core 1"),
    TextCellValue("Uplink Port for Core 2"),
  ]);
  sheet.row(sheet.maxRows - 1).forEach((c) => c?.cellStyle = headerStyle);

  sheet.appendRow([
    TextCellValue(switchItem.name ?? ''),
    TextCellValue(switchItem.serialNumber ?? ''),
    TextCellValue(switchItem.macAdd ?? ''),
    TextCellValue(switchItem.ipAdd ?? ''),
    TextCellValue(switchItem.model ?? ''),
    TextCellValue(switchItem.upLinkCore1?.toString() ?? ''),
    TextCellValue(switchItem.upLinkCore2?.toString() ?? ''),
  ]);

  // ===== Devices Section =====
  sheet.appendRow([]); // empty row
  sheet.appendRow([
    TextCellValue("DEVICE NAME"),
    TextCellValue("SERIAL NUMBER"),
    TextCellValue("MAC ADDRESS"),
    TextCellValue("MODEL"),
    TextCellValue("Switch Port"),
    TextCellValue("Patch Panel Port"),
  ]);
  sheet.row(sheet.maxRows - 1).forEach((c) => c?.cellStyle = headerStyle);

  for (var d in devices) {
    sheet.appendRow([
      TextCellValue(d.deviceName ?? ''),
      TextCellValue(d.deviceSerial ?? ''),
      TextCellValue(d.macAddress ?? ''),
      TextCellValue(d.deviceModel ?? ''),
      TextCellValue(d.portNumber?.toString() ?? ''),
      TextCellValue(d.patchPanel ?? ''),
    ]);
  }

  // ===== Save File =====
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/switch_report.xlsx')
    ..createSync(recursive: true);
  await file.writeAsBytes(excel.encode()!, flush: true);

  // 👉 Open Excel file in external viewer
  await OpenFilex.open(file.path);
}
