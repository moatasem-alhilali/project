import 'package:app_excel2/core/themes/light_mode.dart';
import 'package:flutter/material.dart';

class SubItemSubject extends StatelessWidget {
  SubItemSubject({
    super.key,
    this.onTap,
    this.subTitle,
    this.title,
    this.widget,
  });
  void Function()? onTap;
  String? title;
  Widget? widget;
  String? subTitle;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return InkWell(
      enableFeedback: true,
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(w / 30),
        margin: const EdgeInsets.symmetric(vertical: 4),
        width: w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorsManager.color7,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.color6,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? 'Example',
              textScaleFactor: 1.2,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 92, 92, 92),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.navigate_next_outlined,
                  color: Color.fromARGB(255, 92, 92, 92),
                  size: 35,
                ),
                widget ?? const SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
