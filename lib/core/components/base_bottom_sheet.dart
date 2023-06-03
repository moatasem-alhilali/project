import 'package:app_excel2/core/resources/size_config.dart';
import 'package:app_excel2/core/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Future<void> showBottomSheetFunction({
  required BuildContext context,
  required Widget child,
  double? height,
  Color? backgroundColor,
}) async {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical! * 90,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical! * 2,
                  width: SizeConfig.blockSizeHorizontal! * 15,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorsManager.gray,
                  ),
                ),
                child.animate().fade(duration: 500.ms),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 5,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
