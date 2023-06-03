import 'package:app_excel2/core/components/base_bottom_sheet.dart';
import 'package:app_excel2/core/components/base_home_bage.dart';
import 'package:app_excel2/core/components/base_item.dart';

import 'package:app_excel2/core/resources/assets_fonts.dart';
import 'package:app_excel2/core/themes/light_mode.dart';

import 'package:app_excel2/features/clo_subject/widgets/bottom_sheet_clo_base_data.dart';
import 'package:app_excel2/features/clo_subject/widgets/bottom_sheet_clo_knowledge.dart';
import 'package:app_excel2/features/clo_subject/widgets/bottom_sheet_clo_skills.dart';
import 'package:app_excel2/features/clo_subject/widgets/bottom_sheet_clo_value.dart';
import 'package:app_excel2/features/subject/models/clo_model.dart';
import 'package:app_excel2/features/subject/models/subject_model.dart';
import 'package:flutter/material.dart';

class CloSubjectScreen extends StatelessWidget {
  const CloSubjectScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseHome(
      titleAppBar: "Clos Data",
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(
          Icons.add,
          color: ColorsManager.gray,
        ),
        label: Text(
          "Add Clo",
          style: TextStyle(
            color: ColorsManager.gray,
            fontSize: 18,
            fontFamily: AssetsFonts.InterMedium,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < CloModel.fakeData.length; i++)
            BaseItem(
              title: "clo 1",
              expandChild: Column(
                children: [
                  _BaseItem(
                    counter: "1",
                    title: "base data".toUpperCase(),
                    onTap: () {
                      showBottomSheetFunction(
                          context: context,
                          child: BottomSheetCloBaseData(
                            tittle: "base data".toUpperCase(),
                            baseIdDocsSubjects: SubjectModel.fakeData[0].id!,
                            cloModel: CloModel.fakeData[i],
                          ));
                    },
                  ),

                  //Knowledge
                  _BaseItem(
                    counter: "2",
                    title: "Knowledge",
                    onTap: () {
                      showBottomSheetFunction(
                        context: context,
                        child: BottomSheetCloKnowledge(
                          baseIdDocsSubjects: SubjectModel.fakeData[0].id!,
                          baseIdCloDocs: CloModel.fakeData[i].baseIdDocs,
                        ),
                      );
                    },
                  ),
                  _BaseItem(
                    counter: "3",
                    title: "Skills",
                    onTap: () {
                      showBottomSheetFunction(
                        context: context,
                        child: BottomSheetCloSKills(
                          baseIdDocsSubjects: SubjectModel.fakeData[0].id!,
                          baseIdCloDocs: CloModel.fakeData[i].baseIdDocs,
                        ),
                      );
                    },
                  ),
                  _BaseItem(
                    counter: "4",
                    title: "Values",
                    onTap: () {
                      showBottomSheetFunction(
                          context: context,
                          child: BottomSheetCloValue(
                            baseIdDocsSubjects: SubjectModel.fakeData[0].id!,
                            baseIdCloDocs: CloModel.fakeData[i].baseIdDocs,
                          ));
                    },
                  ),
                ],
              ),
              onTapDelete: () {},
            ),
        ],
      ),
    );
  }
}

class _BaseItem extends StatelessWidget {
  _BaseItem({
    super.key,
    this.onTap,
    required this.title,
    required this.counter,
  });
  void Function()? onTap;
  final String title;
  final String counter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: SubItem(
        onTap: onTap,
        title: title,
      ),
    );
  }
}
