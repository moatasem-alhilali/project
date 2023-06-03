import 'package:app_excel2/core/components/base_bottom_sheet.dart';
import 'package:app_excel2/core/components/base_home_bage.dart';
import 'package:app_excel2/core/components/base_item.dart';
import 'package:app_excel2/core/utils/export_subject.dart';
import 'package:app_excel2/features/base/student/widgets/base_bottom_sheet_student.dart';
import 'package:flutter/material.dart';

class BaseStudentSection extends StatelessWidget {
  const BaseStudentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseHome(
      titleAppBar: "Ali",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            for (int i = 0; i < 3; i++)
              SubItem(
                title: "Quiz${i + 1}",
                onTap: () async {
                  showBottomSheetFunction(
                    context: context,
                    child: BaseBottomSheetStudent(),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
