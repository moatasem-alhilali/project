import 'package:flutter/material.dart';

class BasePopupMenuQuizGlobal extends StatelessWidget {
  BasePopupMenuQuizGlobal({
    super.key,
   
  });
  
  String val = "clo_id 3";
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton(
        tooltip: "chose the clo id!",
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onSelected: (newVal) {
         
        },
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<String>>[
            for (int i = 0; i <3; i++)
              PopupMenuItem<String>(
                enabled: true,
                onTap: () {
                  index = i;
                },
                value: val,
                child: Text(
               val,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
          ];
        },
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$val ",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const Icon(
                Icons.arrow_drop_down_outlined,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
