import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'excel_api.dart';

class HeaderExcel {
  //header Student
  static void headerStudent(Worksheet sheet) {
    //data
    sheet.getRangeByName('A1').setText('S.NO');
    sheet.getRangeByName('B1').setText('ID');
    sheet.getRangeByName('C1').setText('NAME');

    //style
    sheet.getRangeByName('A1:D2').cellStyle.backColor = '#8064a2';
    sheet.getRangeByName('A1:D2').cellStyle.hAlign = HAlignType.center;
    sheet.getRangeByName('A1:D2').cellStyle.vAlign = VAlignType.center;
    sheet.getRangeByName('A1:A2').merge();
    sheet.getRangeByName('B1:B2').merge();
    sheet.getRangeByName('C1:D2').merge();
  }

  //header Clo
  static void headerClo(Worksheet sheet, Map<dynamic, dynamic> cloMap) {
    //index
    int end = ExcelApi.countClo + 5;
    int indexClo = 1;
    for (int i = 5; i < end; i++) {
      sheet.getRangeByIndex(1, i).setText("clo_id $indexClo");
      indexClo++;
    }
    //style
    sheet.getRangeByName('E1:H1').cellStyle.backColor = '#ffff00';
    sheet.getRangeByName('E1:H1').cellStyle.fontColor = '#333F4F';
    sheet.getRangeByName('E1:H1').cellStyle.bold = true;
    sheet.getRangeByName('E1:H1').cellStyle.hAlign = HAlignType.center;
    sheet.getRangeByName('E2:H2').cellStyle.backColor = '#ccc0da';
    sheet.getRangeByName('E1:H2').cellStyle.hAlign = HAlignType.center;
  }

  //Marks Obtained
  static void headerMarksObtained(
      Worksheet sheet, Map<dynamic, dynamic> cloMap) {
    List<dynamic> values = [];
    cloMap.forEach((key, value) {
      values.add(value);
    });

    //
    int range = ExcelApi.countClo + 4;
    String letter = ExcelApi.letters[range];
    String nextLetter = ExcelApi.letters[range + 1];
    //style
    sheet.getRangeByName('${letter}1:${nextLetter}2').merge();
    sheet.getRangeByName('${letter}1:${nextLetter}2').cellStyle.backColor =
        '#8064a2';
    sheet.getRangeByName('${letter}1:${nextLetter}2').cellStyle.fontColor =
        '#ffffff';
    sheet.getRangeByName('${letter}1:${nextLetter}2').cellStyle.vAlign =
        VAlignType.center;
    sheet.getRangeByName('${letter}1:${nextLetter}2').cellStyle.hAlign =
        HAlignType.center;
    //data
    sheet.getRangeByName('${letter}1:${nextLetter}2').setText(
          'Marks/${values[0]}',
        );
  }
}
