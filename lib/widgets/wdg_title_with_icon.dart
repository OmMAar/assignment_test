import 'package:flutter/material.dart';
import 'package:dukkantek_test/constants/constants.dart';

import 'wdg_horizontal_padding.dart';

class WdgTitleWithIcon extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final TextStyle? titleStyle;
  final Color iconColor;

  const WdgTitleWithIcon(
      {Key? key,
      this.title,
      this.iconColor = AppColors.white,
      this.titleStyle,
      this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Visibility(
              visible: iconData != null,
              child: Row(
                children: [
                  Icon(
                    iconData,
                    color: iconColor,
                    size: 22,
                  ),
                  const HorizontalPadding(
                    percentage: 0.02,
                  )
                ],
              )),
          Text(
            title ?? "",
            style: titleStyle ??
                appTextStyle.middleTSBasic.copyWith(color: AppColors.black),
          )
        ],
      ),
    );
  }
}
