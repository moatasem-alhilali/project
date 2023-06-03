import 'package:app_excel2/core/resources/assets_fonts.dart';
import 'package:app_excel2/core/themes/light_mode.dart';
import 'package:flutter/material.dart';

//

class BaseItem extends StatefulWidget {
  void Function()? onTapMore;
  String? title;
  String? subTitle;
  int? indexQuizType;
  Widget? expandChild;
  final bool isOpen;
  void Function()? onTapDelete;
  Future<void> Function()? onTap;
  void Function()? onLongPress;

  BaseItem({
    super.key,
    this.onTapMore,
    this.expandChild,
    this.title,
    this.subTitle,
    this.onTapDelete,
    this.onTap,
    this.indexQuizType,
    this.isOpen = true,
    this.onLongPress,
  });
  @override
  _BaseItemState createState() => _BaseItemState();
}

class _BaseItemState extends State<BaseItem> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: widget.onLongPress,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: widget.onTap,
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(
          horizontal: isExpanded ? 25 : 20,
          vertical: 20,
        ),
        padding: const EdgeInsets.all(20),
        curve: Curves.ease,
        duration: const Duration(seconds: 2),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 197, 197, 197),
              blurRadius: 10,
              offset: Offset(5, 10),
            ),
          ],
          color: const Color.fromARGB(255, 233, 233, 233),
          borderRadius: BorderRadius.all(
            Radius.circular(isExpanded ? 20 : 12),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: widget.onTapMore,
                      icon: const Icon(Icons.more_vert_rounded),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.subTitle ?? "",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 96, 94, 94),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          widget.title ?? "",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 132, 132, 132),
                            fontSize: 14,
                            fontFamily: AssetsFonts.InterRegular,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                FittedBox(
                  child: CircleAvatar(
                    backgroundColor: Colors.blue.withOpacity(.1),
                    child: IconButton(
                      onPressed: !widget.isOpen
                          ? widget.onTap
                          : () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                      icon: Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: Colors.black,
                        size: 27,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            isExpanded
                ? const SizedBox()
                : Column(
                    children: const [
                      Divider(),
                      SizedBox(height: 10),
                    ],
                  ),
            AnimatedCrossFade(
              firstChild: const SizedBox(),
              secondChild: Column(
                children: [
                  // SubItem(),
                  widget.expandChild!,
                ],
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(
                seconds: 1,
              ),
              secondCurve: Curves.ease,
              reverseDuration: Duration.zero,
              sizeCurve: Curves.fastLinearToSlowEaseIn,
            ),
          ],
        ),
      ),
    );
  }
}

//
class SubItem extends StatelessWidget {
  SubItem({
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
