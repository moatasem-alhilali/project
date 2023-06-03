import 'package:app_excel2/core/components/base_home_bage.dart';
import 'package:app_excel2/core/resources/size_config.dart';
import 'package:app_excel2/core/utils/navigator_manager.dart';
import 'package:app_excel2/features/students/view/pages/add_students_screen.dart';
import 'package:app_excel2/features/subject/models/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:app_excel2/core/components/base_item.dart';
import 'package:app_excel2/features/students/models/student_model.dart';
import 'package:app_excel2/features/base/student/pages/base_student_section.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class HomeStudentsScreen extends StatelessWidget {
  const HomeStudentsScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseHome(
      titleAppBar: "All Students",
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 30),
        onPressed: () {
          NavigatorManager.navigateTo(
            context: context,
            page: AddStudentScreen(
            ),
          );
        },
      ),
      child: BodyViewStudents(),
    );
  }
}

class BodyViewStudents extends StatelessWidget {
  const BodyViewStudents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {},
              child: Text("Export Clo Excel?"),
            ),
          ),

          //
          Column(
            children: [
              for (int i = 0; i < StudentModel.fakeData.length; i++)
                FocusedMenuHolder(
                  animateMenuItems: true,
                  menuBoxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  openWithTap: true,
                  menuItems: <FocusedMenuItem>[
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
                  onPressed: () async {},
                  child: BaseItem(
                    title: StudentModel.fakeData[i].name!,
                    expandChild: Item(),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  Item({
    super.key,
  });
  List<String> item = [
    "quizzes",
    "assignments",
    "laps",
    "midTermExams",
    "finalExam",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < 5; i++)
          _Item(
            title: item[i],
            counter: i + 1,
          ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    super.key,
    required this.title,
    required this.counter,
  });

  final String title;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return SubItem(
      onTap: () {
        NavigatorManager.navigateTo(
          context: context,
          page: BaseStudentSection(),
        );
      },
      title: title,
    );
  }
}
