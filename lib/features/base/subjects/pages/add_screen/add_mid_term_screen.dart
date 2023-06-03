import 'package:app_excel2/core/components/base_home_bage.dart';
import 'package:app_excel2/core/components/my_text_form_field.dart';
import 'package:app_excel2/core/resources/assets_fonts.dart';
import 'package:app_excel2/core/resources/size_config.dart';

import 'package:app_excel2/features/subject/models/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/progress_button.dart';

import 'add_quiz_screen.dart';

class AddMedTermScreen extends StatelessWidget {
  AddMedTermScreen({super.key, required this.data});
  final SubjectModel data;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController totalController = TextEditingController();

  int? name;
  int? number;
  int? total;
  final _formKey = GlobalKey<FormState>();
  List<int> itemsQuestion = [1, 2, 3, 4, 5];
  int currentIndex = 1;

  List<int> itemsTotal = [5, 10];
  int currentIndexTotal = 5;
  @override
  Widget build(BuildContext context) {
    return BaseHome(
      titleAppBar: "Add mid Term Exams ",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: MyTextFormField(
                hintText: "name of new mid Term Exams",
                controller: nameController,
                keyboardType: TextInputType.text,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MyTextFormField(
                    readOnly: true,
                    height: SizeConfig.blockSizeVertical! * 8,
                    suffixIcon: PopupMenuButtonCustomAdded(
                      onSelected: (val) {
                        numberController.text = val.toString();
                        number = val;
                      },
                      items: itemsQuestion,
                      index: currentIndex,
                    ),
                    controller: numberController,
                    hintText: "count question ",
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),

                //total
                Expanded(
                  child: MyTextFormField(
                    readOnly: true,
                    height: SizeConfig.blockSizeVertical! * 8,
                    suffixIcon: PopupMenuButtonCustomAdded(
                      onSelected: (val) {
                        totalController.text = val.toString();
                        total = val;
                        print(val);
                      },
                      items: itemsTotal,
                      index: currentIndexTotal,
                    ),
                    controller: totalController,
                    hintText: "total degree",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
             _BaseProgressButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
             
              }
            },
            buttonState: ButtonState.idle,
          ),
        ],
      ),
    ),
    );
  }
}

class _BaseProgressButton extends StatelessWidget {
  const _BaseProgressButton({
    super.key,
    required this.onPressed,
    this.buttonState = ButtonState.idle,
    this.text = "create",
  });
  final String text;
  final Function onPressed;
  final ButtonState buttonState;
  @override
  Widget build(BuildContext context) {
    return ProgressButton(
      height: SizeConfig.blockSizeVertical! * 8,
      padding: const EdgeInsets.all(8),
      radius: 15.0,
      stateWidgets: {
        ButtonState.idle: Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: AssetsFonts.InterMedium,
          ),
        ),
        ButtonState.loading: Text(
          "Loading".toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: AssetsFonts.InterMedium,
          ),
        ),
        ButtonState.fail: Text(
          "Fail".toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: AssetsFonts.InterMedium,
          ),
        ),
        ButtonState.success: Text(
          "Success".toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: AssetsFonts.InterMedium,
          ),
        )
      },
      stateColors: {
        ButtonState.idle: Colors.deepPurple.shade500,
        ButtonState.loading: Colors.deepPurple.shade700,
        ButtonState.fail: Colors.red.shade300,
        ButtonState.success: Colors.green.shade400,
      },
      onPressed: onPressed,
      state: buttonState,
    );
  }
}
