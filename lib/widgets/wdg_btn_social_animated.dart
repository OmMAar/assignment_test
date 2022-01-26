import 'package:animate_do/animate_do.dart';
import 'package:dukkantek_test/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'wdg_btn_user_management.dart';
import 'wdg_horizontal_padding.dart';

class SocialAnimatedButton extends StatelessWidget {
  final double width;
  final double height;
  final double? borderRadius;
  final double? iconSize;
  final Duration duration;
  final IconData? icon;
  final bool isSvg;
  final String? iconSvg;
  final Widget? icWidget;
  final String title;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final Function() onTap;

  const SocialAnimatedButton(
      {Key? key,
      required this.onTap,
      this.icon,
      required this.title,
      required this.width,
      this.isSvg = false,
      this.iconSize = 20,
      this.iconSvg,
      this.icWidget,
      this.backgroundColor,
      this.borderRadius,
      this.iconColor,
      this.textColor,
      this.height = 40,
      this.duration = const Duration(milliseconds: 750)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      delay: duration,
      child: UserManagementButton(
        width: width,
        height: height,
        child: Row(
          children: [
            const HorizontalPadding(
              percentage: 0.05,
            ),
            isSvg
                ? SvgPicture.asset(
                    iconSvg ?? "",
                    width: iconSize,
                    height: iconSize,
                    color: iconColor,
                  )
                : icon !=null ? Icon(
                    icon,
                    color: iconColor ?? AppColors.black,
                    size: iconSize,
                  ) : icWidget != null ? icWidget!: Container(),
            Flexible(
              child: Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  title,
                  style: appTextStyle.smallTSBasic
                      .copyWith(color: textColor ?? AppColors.black,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const HorizontalPadding(
              percentage: 0.05,
            ),
          ],
        ),
        backgroundColor: backgroundColor ?? AppColors.white,
        borderRadius: borderRadius ?? 0.0,
        borderColor: backgroundColor ?? AppColors.white,
        onPressed: onTap,
      ),
    );
  }
}
