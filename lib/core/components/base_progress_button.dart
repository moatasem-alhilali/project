import 'package:app_excel2/core/resources/assets_fonts.dart';
import 'package:app_excel2/core/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/progress_button.dart';

class BaseProgressButton extends StatelessWidget {
  const BaseProgressButton({
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
