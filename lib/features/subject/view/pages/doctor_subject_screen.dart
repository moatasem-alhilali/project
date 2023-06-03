import 'package:app_excel2/core/components/base_home_bage.dart';
import 'package:app_excel2/core/components/my_text_form_field.dart';
import 'package:app_excel2/core/resources/assets_fonts.dart';
import 'package:app_excel2/core/resources/size_config.dart';

import 'package:flutter/material.dart';
import 'package:progress_state_button/progress_button.dart';

class DoctorSubjectScreen extends StatelessWidget {
  DoctorSubjectScreen({
    super.key,
  });

  TextEditingController qualification = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController instructor = TextEditingController();
  TextEditingController titleSubject = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseHome(
      titleAppBar: "Doctor information",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _MyTextFormFieldSubject(
                  hintText: "Lecturer name",
                  controller: instructor,
                  labelText: "DR",
                  readOnly: true,
                ),
                _MyTextFormFieldSubject(
                  messageValidate: "The Course Title Field Required ",
                  hintText: "Lecturer name",
                  controller: titleSubject,
                  labelText: "Course Title",
                  readOnly: true,
                ),
                _MyTextFormFieldSubject(
                  hintText: "Qualification",
                  labelText: "Qualification",
                  controller: qualification,
                  messageValidate: "The Department Field Required ",
                ),
                _MyTextFormFieldSubject(
                  labelText: "Phone number",
                  messageValidate: "The Instructor name Field Required ",
                  hintText: "Phone number",
                  controller: phoneNumber,
                ),
                _MyTextFormFieldSubject(
                  labelText: "Description",
                  messageValidate: "The Semester Field Required ",
                  hintText: "Description",
                  controller: description,
                ),
                const SizedBox(
                  height: 10,
                ),
                _BaseProgressButton(
                  buttonState: ButtonState.idle,
                  text: "Save Changes",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
              ],
            ),
          ),
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
    SizeConfig().init(context);
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

class _MyTextFormFieldSubject extends StatelessWidget {
  _MyTextFormFieldSubject({
    super.key,
    required this.hintText,
    this.labelText,
    this.textAlign = TextAlign.start,
    this.keyboardType,
    this.suffixIcon,
    this.height,
    this.onChanged,
    this.readOnly,
    this.controller,
    this.messageValidate,
    this.validator,
  });
  String? hintText;
  String? Function(String?)? validator;
  String? labelText;
  String? messageValidate;
  double? height;
  TextEditingController? controller;
  TextAlign? textAlign;
  Widget? suffixIcon;
  bool? readOnly;
  TextInputType? keyboardType;

  /// مراقبة إدخال النص
  final Function(String text)? onChanged;

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        readOnly: readOnly ?? false,
        validator: (value) {
          if (value!.isEmpty) {
            return messageValidate ?? "The Field Cant Be Empty";
          }
          return null;
        },
        controller: controller,
        keyboardType: keyboardType,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Color.fromARGB(255, 77, 76, 76),
          fontFamily: AssetsFonts.InterMedium,
        ),
        textAlign: textAlign!,
        decoration: InputDecoration(
          labelText: labelText,
          filled: false,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: AssetsFonts.InterMedium,
            fontSize: 18,
            color: Colors.grey,
          ),
          helperStyle: Theme.of(context).textTheme.headlineSmall,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          labelStyle: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.grey),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
