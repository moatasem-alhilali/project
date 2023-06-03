import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_excel2/core/resources/assets_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TextInfo extends StatelessWidget {
  const TextInfo({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      // width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 197, 197, 197),
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
        color: Color.fromARGB(255, 233, 233, 233),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.black,
          fontFamily: AssetsFonts.InterMedium,
          fontSize: 15,
        ),
        child: AnimatedTextKit(
          repeatForever: false,
          animatedTexts: [
            TyperAnimatedText(text),
          ],
          isRepeatingAnimation: false,
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    ).animate().fade(duration: 1000.ms);
  }
}
