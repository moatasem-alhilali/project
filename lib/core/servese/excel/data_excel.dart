import 'package:app_excel2/core/servese/excel/excel_api.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class DataExcel {
  //student
  static void dataStudents(
    Worksheet sheet,
    List<Map<String, dynamic>> dataStudents,
  ) {
    int range = ExcelApi.countClo + 4;
    String letterColumn = ExcelApi.letters[range];
    String nextLetter = ExcelApi.letters[range + 1];

    //index
    int indexRow = 3;
    int indexStudent = 1;

    int countClo = ExcelApi.countClo + 4;
    for (var element in dataStudents) {
      //style Mark Obtained
      sheet
          .getRangeByName('$letterColumn$indexRow:$nextLetter$indexRow')
          .merge();
      sheet
          .getRangeByName('$letterColumn$indexRow:$nextLetter$indexRow')
          .cellStyle
          .hAlign = HAlignType.center;
      //style student
      sheet.getRangeByName('C$indexRow:D$indexRow').merge();
      sheet.getRangeByName('C$indexRow:D$indexRow').cellStyle.hAlign =
          HAlignType.center;
      sheet.getRangeByName('A$indexRow:D$indexRow').cellStyle.fontColor =
          '#333F4F';
      sheet.getRangeByName('A$indexRow:D$indexRow').cellStyle.hAlign =
          HAlignType.center;
      sheet.getRangeByName('A$indexRow:D$indexRow').cellStyle.bold = true;
      sheet.getRangeByName('E$indexRow:H$indexRow').cellStyle.hAlign =
          HAlignType.center;

      //check if he has a marks
      if (element['total'] != 0.0) {
        sheet
            .getRangeByIndex(indexRow, 1)
            .setText(element['SNOSTUDENT'].toString());
        sheet.getRangeByIndex(indexRow, 2).setText("$indexStudent");
        sheet.getRangeByIndex(indexRow, 3).setText(element['nameStudent']);

        //set degree clo
        int cloIndexDegree = 5;
        int indexClo = 1;
        var cloId = 'clo_id $indexClo';
        while (cloIndexDegree <= countClo) {
          cloId = 'clo_id $indexClo';
          //set marks clo for student
          sheet
              .getRangeByIndex(indexRow, cloIndexDegree)
              .setText(element[cloId].toString());
          //increment
          indexClo++;
          cloIndexDegree++;
        }
        //set total marks
        sheet
            .getRangeByName('$letterColumn$indexRow:$nextLetter$indexRow')
            .setText(element['total'].toString());
      } else {
        //set just name with out any marks
        sheet
            .getRangeByIndex(indexRow, 1)
            .setText(element['SNOSTUDENT'].toString());
        sheet.getRangeByIndex(indexRow, 2).setText("$indexStudent");
        sheet.getRangeByIndex(indexRow, 3).setText(element['nameStudent']);
      }

      //increment variable
      indexRow++;
      countClo++;
      indexStudent++;
    }
  }

  //clo
  static void dataClo(Worksheet sheet, Map<dynamic, dynamic> cloMap) {
    int end = ExcelApi.countClo + 5;

    int index = 1;
    for (int i = 5; i < end; i++) {
      final cloId = 'clo_id $index';
      sheet.getRangeByIndex(2, i).setText(cloMap[cloId].toString());
      index++;
    }
  }
}
