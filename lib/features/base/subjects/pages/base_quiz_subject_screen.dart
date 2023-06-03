import 'package:app_excel2/core/components/base_bottom_sheet.dart';
import 'package:app_excel2/core/components/base_home_bage.dart';
import 'package:app_excel2/core/themes/light_mode.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_excel2/core/components/base_input_field.dart';
import 'package:app_excel2/core/components/base_item.dart';
import 'package:app_excel2/core/components/base_my_text.dart';
import 'package:app_excel2/core/components/base_progress_button.dart';
import 'package:app_excel2/core/components/base_table.dart';
import 'package:app_excel2/core/components/text_info.dart';
import 'package:app_excel2/core/resources/assets_fonts.dart';
import 'package:app_excel2/core/resources/size_config.dart';
import 'package:app_excel2/features/base/subjects/widgets/base_popup_menu_quiz.dart';

import 'package:flutter/material.dart';
import 'package:progress_state_button/progress_button.dart';

class BaseQuizSubjectScreen extends StatelessWidget {
  BaseQuizSubjectScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseHome(
      titleAppBar: "course Title",
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {},
        icon: Icon(
          Icons.add_outlined,
          color: ColorsManager.gray,
        ),
        label: Text(
          "Add Quiz",
          style: TextStyle(
            color: ColorsManager.gray,
          ),
        ),
      ),
      child: BaseBodyViewSectionSubject(),
    );
  }
}

class BaseBodyViewSectionSubject extends StatelessWidget {
  BaseBodyViewSectionSubject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {},
              child: Text("Export Clo Excel?"),
            ),
          ),
          for (int i = 0; i < 4; i++)
            SubItem(
              widget: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_outline_outlined,
                  color: Color.fromARGB(255, 92, 92, 92),
                ),
              ),
              title: " quiz 1",
              onTap: () async {
                showBottomSheetFunction(
                    context: context, child: BaseBottomSheetSectionSubject());
              },
            )
        ],
      ),
    );
  }
}

//----------------Bottom Sheet--------------------
class BaseBottomSheetSectionSubject extends StatelessWidget {
  const BaseBottomSheetSectionSubject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _Item();
  }
}

class _Item extends StatelessWidget {
  _Item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 15,
          ),
          AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                speed: const Duration(seconds: 1),
                "title",
                colors: [
                  Colors.black,
                  Colors.grey,
                ],
                textStyle: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal! * 8,
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
            height: 15,
          ),
          const TextInfo(
              text: "Choose the clo for each question through the icon"),
          const SizedBox(
            height: 5,
          ),
          BaseTable(
            firstChildren: [
              for (int i = 0; i < 3; i++)
                BaseMyText(
                  title: "name",
                ),
            ],
            secondChildren: [
              for (int index = 0; index < 3; index++)
                Column(
                  children: [
                    BasePopupMenuQuizGlobal(),
                  ],
                ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const TextInfo(
            text: "set the degree for each question through the Field",
          ),
          const SizedBox(
            height: 5,
          ),
          BaseTable(
            firstChildren: [
              for (int i = 0; i < 3; i++)
                BaseMyText(
                  title: "name",
                ),
              const BaseMyText(
                title: "Total",
              ),
            ],
            secondChildren: [
              for (int index = 0; index < 3; index++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BaseTextField(
                    hintText: "hint",
                    onChanged: (val) {},
                  ),
                ),
              BaseTextField(
                hintText: "10.0",
                readOnly: true,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          BaseProgressButton(
            onPressed: () {},
            text: "Save changes",
            buttonState: ButtonState.idle,
          ),
        ],
      ),
    );
  }
}
