import 'package:app_excel2/features/splash/widgets/page_transition.dart';
import 'package:flutter/material.dart';

class NavigatorManager {
  //navigate To

  static void navigateTo({
    required BuildContext context,
    required Widget page,
  }) {
    Navigator.push(
      context,
      SecondPageTransition(page),
    );
  }
}

class SecondPageTransition extends PageRouteBuilder {
  final Widget page;

  SecondPageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}
