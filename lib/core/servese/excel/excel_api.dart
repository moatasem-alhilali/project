import 'dart:io';

import 'package:app_excel2/core/servese/excel/data_excel.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'header_excel.dart';

class ExcelApi {
  static int countClo = 0;
  static int endTableRange = 0;
  static int countStudent = 0;
  //color excel
  static const cloNameRowColor = "#ffff00";
  static const cloSumDegreeRowColor = "#ccc0da";
  static const studentRowColor = "#8064a2";
  static const degreeSumStudentColor = "#1f65aa";

  static List<String> letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "P",
    "Q"
  ];

  //create excel file
  static Future<void> createExcel({
    required Map<dynamic, dynamic> baseDataClo,
    required List<Map<String, dynamic>> dataStudent,
  }) async {
    countClo = baseDataClo.length - 1;
    try {
      print("===============baseDataClo=====================");
      print(baseDataClo);
      print("================dataStudent====================");
      print(dataStudent);
      final Workbook workbook = Workbook(1);
      final Worksheet sheet = workbook.worksheets[0];

      //student
      HeaderExcel.headerStudent(sheet);
      DataExcel.dataStudents(sheet, dataStudent);

      //clo
      HeaderExcel.headerClo(sheet, baseDataClo);
      DataExcel.dataClo(sheet, baseDataClo);

      //Mark Obtained
      HeaderExcel.headerMarksObtained(sheet, baseDataClo);

      //Create a table with the data in given range.
      endTableRange = countClo + 4 + 2;
      countStudent = 2 + dataStudent.length;
      sheet.tableCollection.create(
        'Table1',
        sheet.getRangeByName('A1:${letters[endTableRange - 1]}$countStudent'),
      );

      //save excel and open
      final List<int> bytes = workbook.saveAsStream();
      await saveAndOpenFile(bytes);
      workbook.dispose();
    } catch (e) {
      print(e);
    }
  }

  //save And Open File
  static Future<void> saveAndOpenFile(List<int> bytes) async {
    final path = (await getExternalStorageDirectory())!.path;
    final String fileName = '$path/Output.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
    await OpenFile.open(fileName);
  }
}
