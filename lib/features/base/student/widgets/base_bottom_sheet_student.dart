import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_excel2/core/components/base_input_field.dart';
import 'package:app_excel2/core/components/base_my_text.dart';
import 'package:app_excel2/core/components/base_progress_button.dart';
import 'package:app_excel2/core/components/base_table.dart';
import 'package:app_excel2/core/resources/assets_fonts.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/progress_button.dart';

class BaseBottomSheetStudent extends StatelessWidget {
  BaseBottomSheetStudent({
    super.key,
  });

  double sum = 0.0;
  final colorizeColors = [
    Colors.black,
    Colors.grey,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                textStyle: const TextStyle(
                  fontSize: 50.0,
                  fontFamily: AssetsFonts.InterMedium,
                ),
              ),
            ],
            isRepeatingAnimation: true,
            onTap: () {
              print("Tap Event");
            },
          ),
          DefaultTextStyle(
            style: const TextStyle(
              color: Colors.grey,
              fontFamily: AssetsFonts.InterMedium,
              fontSize: 16,
            ),
            child: AnimatedTextKit(
              repeatForever: false,
              animatedTexts: [
                TyperAnimatedText(
                  "this is the degree for ",
                ),
              ],
              isRepeatingAnimation: false,
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          BaseTable(
            firstChildren: [
              for (int i = 0; i < 3; i++) BaseMyText(title: "q1 "),
              BaseMyText(title: "total".toUpperCase()),
            ],
            secondChildren: [
              for (int i = 0; i < 3; i++)
                BaseTextField(
                  hintText: "3",
                  onChanged: (val) {},
                ),
              BaseTextField(
                readOnly: true,
                hintText: "sum Of Quiz",
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          BaseProgressButton(
            onPressed: () {},
            text: "Update",
            buttonState: ButtonState.idle,
          ),
        ],
      ),
    );
  }
}
