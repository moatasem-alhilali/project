class CloModelReport {
  String? cloTypeName;
  double? degreeClo;
  String? cloId;

  CloModelReport({
    this.cloTypeName,
    this.degreeClo,
    this.cloId,
  });

  CloModelReport.fromMap(Map<String, dynamic> json) {
    cloTypeName = json['clo_name'];
    degreeClo = json['clo_degree'];
    cloId = json['clo_id'];
  }
}

//Clo Student Model Report
class CloStudentModelReport {
  String? cloName;
  double? degree;
  String? name;
  String? nameStudent;
  int? idStudent;

  CloStudentModelReport({
    this.cloName,
    this.degree,
    this.name,
    this.nameStudent,
    this.idStudent,
  });

  //

  CloStudentModelReport.fromMap(
    Map<String, dynamic> json, {
    String? nameStudentM,
    int? subIdStudent,
  }) {
    cloName = json['clo_name'];
    degree = json['degree'];
    name = json['name'];
    nameStudent = nameStudentM;
    idStudent = subIdStudent;
  }
}
