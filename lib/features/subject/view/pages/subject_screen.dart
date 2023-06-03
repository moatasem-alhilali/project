import 'package:app_excel2/features/subject/models/subject_model.dart';
import 'package:app_excel2/features/subject/view/widgets/base_item.dart';
import 'package:app_excel2/features/subject/view/widgets/sub_Item_subject.dart';

import '../../../../core/utils/export_subject.dart';
import 'package:app_excel2/core/components/base_item.dart';
import 'package:app_excel2/features/subject/view/pages/doctor_subject_screen.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseHome(
      titleAppBar: "Subjects",
      actions: [
        About(),
      ],
      isBack: false,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(
          Icons.add,
          color: ColorsManager.gray,
        ),
        label: Text(
          "Add Subject",
          style: TextStyle(
            color: ColorsManager.gray,
            fontSize: 18,
            fontFamily: AssetsFonts.InterMedium,
          ),
        ),
      ),
      child: BodyViewSubject(
        dataSubject: SubjectModel.fakeData,
      ).animate().fade(duration: 500.ms),
    );
  }
}

class BodyViewSubject extends StatefulWidget {
  BodyViewSubject({super.key, required this.dataSubject});
  final List<SubjectModel> dataSubject;

  @override
  State<BodyViewSubject> createState() => _MainItemState();
}

class _MainItemState extends State<BodyViewSubject> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < SubjectModel.fakeData.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FocusedMenuHolder(
              animateMenuItems: true,
              menuBoxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              openWithTap: true,
              menuItems: <FocusedMenuItem>[
                FocusedMenuItem(
                  title: const Text("Clo Excel"),
                  trailingIcon: const Icon(Icons.file_open),
                  onPressed: () {},
                ),
                FocusedMenuItem(
                  title: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  trailingIcon: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {},
                ),
              ],
              onPressed: () {},
              child: BaseItemSubject(
                subTitle: SubjectModel.fakeData[i].instructorName,
                title: SubjectModel.fakeData[i].courseTitle!,
                expandChild: _Item(
                  data: SubjectModel.fakeData[i],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  _Item({
    super.key,
    required this.data,
  });
  final SubjectModel data;

  List<String> title = [
    "Students",
    "Quiz",
    "Assignment",
    "Laps",
    "Mid Term Exams",
    "Final Exam",
    "Clos",
  ];
  List<String> quizType = [
    "Students",
    "quizzes",
    "assignments",
    "laps",
    "midTermExams",
    "finalExam",
    "Clos",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubItemSubject(
          title: "Lecturer",
          onTap: () {
            NavigatorManager.navigateTo(
              context: context,
              page: DoctorSubjectScreen(),
            );
          },
        ),
        for (int i = 0; i < title.length; i++)
          //students
          SubItem(
            title: title[i],
            onTap: () {},
          ),
      ],
    );
  }
}
