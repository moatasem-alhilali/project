import 'package:app_excel2/core/utils/export.dart';
import 'package:app_excel2/features/base/student/pages/base_student_section.dart';
import 'package:app_excel2/features/clo_subject/pages/add_clo_subject_screen.dart';
import 'package:app_excel2/features/clo_subject/pages/clo_subject_screen.dart';
import 'package:app_excel2/features/students/view/pages/add_students_screen.dart';
import 'package:app_excel2/features/students/view/pages/home_students_screen.dart';
import 'package:app_excel2/features/subject/view/pages/add_subject_screen.dart';
import 'package:app_excel2/features/subject/view/pages/doctor_subject_screen.dart';
import 'package:app_excel2/features/subject/view/pages/subject_screen.dart';

import 'features/base/subjects/pages/base_quiz_subject_screen.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..checkInternet(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        theme: getLightMode(),
        title: 'Student CLO',
        debugShowCheckedModeBanner: false,
        home: BaseQuizSubjectScreen(),
      ),
    );
  }
}
