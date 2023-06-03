class StudentModel {
  int? idStudent;
  String? name;
  String? idDocs;
  StudentModel({
    this.idStudent,
    this.name = "",
    this.idDocs,
  });
  StudentModel.fromMap({
    required Map<String, dynamic> json,
    required String IdDocs,
  }) {
    name = json['name'];
    idDocs = IdDocs;
    idStudent = json['ID'] ?? 0;
  }

  Map<String, dynamic> toMap() => {
        'ID': idStudent,
        'name': name,
      };

  static List<StudentModel> fakeData = [
    StudentModel(
      idDocs: "",
      idStudent: 123456789,
      name: "Ali Ahmed",
    ),
    StudentModel(
      idDocs: "",
      idStudent: 123456789,
      name: "Ali Ahmed",
    ),
    StudentModel(
      idDocs: "",
      idStudent: 123456789,
      name: "Ali Ahmed",
    ),
  ];
}
