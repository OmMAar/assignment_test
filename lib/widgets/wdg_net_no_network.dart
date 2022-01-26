import 'package:dukkantek_test/constants/con_colors.dart';
import 'package:dukkantek_test/constants/con_dimens.dart';
import 'package:dukkantek_test/constants/con_letter_spacing.dart';
import 'package:dukkantek_test/constants/con_radius.dart';
import 'package:dukkantek_test/constants/con_text_style.dart';
import 'package:dukkantek_test/utils/utils.dart';
import 'package:flutter/material.dart';

class NoNetworkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// todo add the config message otherwise set default one
    ///    String _label = ConfigManager().content("network_unavailable_message");
    /// String label = _label == null || _label.isEmpty ? "You are offline" : _label;
    double width = DeviceUtils.getScaledWidth(context, 1);
    return Container(
        margin: EdgeInsets.all(AppDimens.space12),
        padding: EdgeInsets.all(AppDimens.space12),
        width: width * .7,
        decoration: BoxDecoration(
          /// todo add the config theme color
          //   color: GlobalConfig.app_theme_disabled_button_color,
          color: AppColors.darkGreen,
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.radius6))),
        child: Text("You are offline",
            textAlign: TextAlign.center,
            style: appTextStyle.minTSBasic.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: appLetterSpacing.letterSpacingBody2)));
  }
}
