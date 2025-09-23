import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;

import 'package:flutter_application_1/features/home/Racks/data/models/summary_model/summary_item.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';

Future<void> generateSingleSheetExcel({
  required SwitchItem switchItem,
  required List<SummaryItem> summaries,
  required List<DeviceItem> devices,
}) async {
  final workbook = xlsio.Workbook();
  final sheet = workbook.worksheets[0];
  sheet.name = 'Report';

  // ===== Load Logo =====
  final ByteData logoBytes = await rootBundle.load(
    'assets/images/PowerSMTPLogo.png',
  );
  final List<int> logo = logoBytes.buffer.asUint8List();

  // Add image at row 1, col 1
  final picture = sheet.pictures.addStream(1, 1, logo);
  picture.height = 60;
  picture.width = 60;

  // Place title in col 3 so it doesn't overlap
  final titleCell = sheet.getRangeByName('C1');
  titleCell.setText(switchItem.name ?? '');
  titleCell.cellStyle.bold = true;
  titleCell.cellStyle.fontSize = 16;
  sheet.getRangeByName('C1:H1').merge();

  // ===== Summary Section =====
  int currentRow = 5;
  sheet.getRangeByIndex(currentRow, 1).setText('Summary');
  sheet.getRangeByIndex(currentRow, 1).cellStyle.backColor = '#FFFF00';
  sheet
      .getRangeByIndex(currentRow, 1, currentRow, summaries.length + 1)
      .merge();
  currentRow++;

  // Header row style
  final headerStyle = workbook.styles.add('headerStyle');
  headerStyle.bold = true;
  headerStyle.backColor = '#FFFF00';
  headerStyle.hAlign = xlsio.HAlignType.center;

  // Summary rows
  final labels = ['AP Room', 'AP Out', 'CCTV In', 'CCTV Out'];
  for (final label in labels) {
    sheet.getRangeByIndex(currentRow, 1).setText(label);
    int col = 2;
    for (var summary in summaries) {
      switch (label) {
        case 'AP Room':
          sheet
              .getRangeByIndex(currentRow, col)
              .setText(summary.apRoom?.toString() ?? "0");

          break;
        case 'AP Out':
          sheet
              .getRangeByIndex(currentRow, col)
              .setText(summary.apOut?.toString() ?? '0');
          break;
        case 'CCTV In':
          sheet
              .getRangeByIndex(currentRow, col)
              .setText(summary.cctvIn?.toString() ?? '0');
          break;
        case 'CCTV Out':
          sheet
              .getRangeByIndex(currentRow, col)
              .setText(summary.cctvOut?.toString() ?? '0');
          break;
      }
      col++;
    }
    currentRow++;
  }

  currentRow++;

  // ===== Switch Info Section =====
  final switchHeaders = [
    'DEVICE NAME',
    'SERIAL NUMBER',
    'MAC ADDRESS',
    'IP ADDRESS',
    'MODEL',
    'Uplink Port for Core 1',
    'Uplink Port for Core 2',
  ];
  sheet.importList(switchHeaders, currentRow, 1, false);
  sheet
          .getRangeByIndex(currentRow, 1, currentRow, switchHeaders.length)
          .cellStyle =
      headerStyle;
  currentRow++;

  sheet.importList(
    [
      switchItem.name ?? '',
      switchItem.serialNumber ?? '',
      switchItem.macAdd ?? '',
      switchItem.ipAdd ?? '',
      switchItem.model ?? '',
      switchItem.upLinkCore1?.toString() ?? '',
      switchItem.upLinkCore2?.toString() ?? '',
    ],
    currentRow,
    1,
    false,
  );

  currentRow += 2;

  // ===== Devices Section =====
  final deviceHeaders = [
    'DEVICE NAME',
    'SERIAL NUMBER',
    'MAC ADDRESS',
    'MODEL',
    'Switch Port',
    'Patch Panel Port',
  ];
  sheet.importList(deviceHeaders, currentRow, 1, false);
  sheet
          .getRangeByIndex(currentRow, 1, currentRow, deviceHeaders.length)
          .cellStyle =
      headerStyle;
  currentRow++;

  for (var d in devices) {
    sheet.importList(
      [
        d.deviceName ?? '',
        d.deviceSerial ?? '',
        d.macAddress ?? '',
        d.deviceModel ?? '',
        d.portNumber?.toString() ?? '',
        d.patchPanel ?? '',
      ],
      currentRow,
      1,
      false,
    );
    currentRow++;
  }

  // ===== Auto-fit columns =====
  sheet.autoFitColumn(1);
  for (int i = 1; i <= 7; i++) {
    sheet.autoFitColumn(i);
  }

  // ===== Save File =====
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();

  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/switch_report.xlsx')
    ..createSync(recursive: true)
    ..writeAsBytesSync(bytes, flush: true);

  await OpenFilex.open(file.path);
}
