import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_excel2/core/components/base_table.dart';
import 'package:app_excel2/core/resources/assets_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_popup_menu_clo.dart';

class BottomSheetCloKnowledge extends StatelessWidget {
  BottomSheetCloKnowledge({
    super.key,
    this.baseIdDocsSubjects,
    this.baseIdCloDocs,
  });
  final String? baseIdDocsSubjects;
  String? baseIdCloDocs;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              speed: const Duration(seconds: 1),
              "Knowledge & Understanding".toUpperCase(),
              colors: [
                Colors.black,
                Colors.grey,
              ],
              textStyle: const TextStyle(
                fontSize: 20.0,
                fontFamily: AssetsFonts.InterMedium,
              ),
            ),
          ],
          isRepeatingAnimation: true,
          onTap: () {
            print("Tap Event");
          },
        ),
        const SizedBox(
          height: 25,
        ),
        BaseTable(
          firstChildren: [
            for (int i = 0; i < 3; i++)
              Text(
                "subCloId!",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
          ],
          secondChildren: [
            for (int i = 0; i <3; i++)
              BasePopupMenuClo(
                baseIdDocsSubjects: baseIdDocsSubjects,
                baseIdCloDocs: baseIdCloDocs,
              
                docsNameCollectionDetail: "knowledge",
              ),
          ],
        ),
      ],
    );
  }
}
