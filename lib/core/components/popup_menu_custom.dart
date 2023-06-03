import 'package:app_excel2/features/subject/models/clo_model.dart';
import 'package:flutter/material.dart';

class PopupMenuButtonCustom extends StatelessWidget {
  PopupMenuButtonCustom({
    super.key,
    this.onPressedDelete,
    this.onPressedInfo,
    this.onSelected,
    this.selected,
    this.items,

    //------------------------
    this.baseDocsIdSubject,
    this.dataClo,
    this.docsQuiz,
    this.indexQuestion,
  });
  void Function()? onPressedDelete;
  void Function()? onPressedInfo;
  void Function(String)? onSelected;
  String? selected;
  List<String>? items;
  //------------------------
  List<CloModel>? dataClo;
  String? docsQuiz;

  String? baseDocsIdSubject;
  int? indexQuestion;
  String val = "clo_id 3";
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        // onSelected: onSelected,
        onSelected: (newVal) {
         
        },
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<String>>[
            for (int i = 0; i < items!.length; i++)
              PopupMenuItem<String>(
                enabled: true,
                onTap: () {
                  index = i;
                },
                value: items![i],
                child: Text(
                  items![i],
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
          ];
        },
        child: Text(
          selected!,
        ),
      ),
    );
  }
}
