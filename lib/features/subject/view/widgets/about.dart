import 'package:app_excel2/core/resources/assets_fonts.dart';
import 'package:app_excel2/core/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class About extends StatelessWidget {
  About({
    super.key,
  });
  List data = [
    {
      "name": "محمد صالح ال كبيبة",
      "id": 439100152,
    },
    {
      "name": "طلال مهدي ال زمانان",
      "id": 439100046,
    },
    {
      "name": "صالح محمد حمد ال فلكه",
      "id": 441102327,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.info,
              confirmBtnText: "رجوع",
              title: 'فريق العمل',
              showCancelBtn: false,
              widget: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    for (int i = 0; i < data.length; i++)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 197, 197, 197),
                                blurRadius: 10,
                                offset: Offset(5, 10),
                              ),
                            ],
                            color: Color.fromARGB(255, 233, 233, 233),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            )),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              "${i + 1}",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 96, 94, 94),
                              ),
                            ),
                          ),
                          subtitle: Text(
                            data[i]['id'].toString(),
                            style: const TextStyle(
                              fontFamily: AssetsFonts.InterBlack,
                              color: Color.fromARGB(255, 96, 94, 94),
                            ),
                          ),
                          title: Text(
                            data[i]['name'],
                            style: const TextStyle(
                              fontFamily: AssetsFonts.InterBlack,
                              color: Color.fromARGB(255, 96, 94, 94),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.info_outline,
            color: Colors.white,
            size: 35,
          ),
        ),
      ],
    );
  }
}
