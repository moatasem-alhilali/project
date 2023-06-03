import 'package:app_excel2/core/components/base_my_text.dart';
import 'package:app_excel2/core/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BaseTable extends StatelessWidget {
  BaseTable({
    super.key,
    this.firstChildren,
    this.secondChildren,
    this.child,
    this.child2,
  });
  List<Widget>? firstChildren;
  List<Widget>? secondChildren;
  Widget? child;
  Widget? child2;
  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      border: TableBorder.all(
        width: 1.0,
        borderRadius: BorderRadius.circular(8),
        color: ColorsManager.gray,
      ),
      children: [
        TableRow(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorsPalette.pink,
          ),
          children: firstChildren ??
              [
                const BaseMyText(title: "degree"),
                const BaseMyText(title: "degree"),
                const BaseMyText(title: "degree"),
              ],
        ),
        TableRow(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorsPalette.purple,
          ),
          children: secondChildren ??
              [
                const BaseMyInputTable(),
                const BaseMyInputTable(),
                const BaseMyInputTable(),
              ],
        ),
      ],
    ).animate().fade(duration: 600.ms);
    ;
  }
}

class BaseMyInputTable extends StatelessWidget {
  const BaseMyInputTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintStyle: TextStyle(),
        fillColor: Colors.transparent,
        hintText: "0.0",
        border: InputBorder.none,
      ),
    );
  }
}
