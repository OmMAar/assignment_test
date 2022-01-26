import 'package:dukkantek_test/constants/constants.dart';
import 'package:flutter/material.dart';


class RoundedShadowButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  final Color? shadowColor;
  final VoidCallback? onPressed;
  final double? spreadRadius;
  final bool? withBorder;

  const RoundedShadowButton(
      {Key? key,
      this.child,
      this.color,
      this.textColor,
      this.height,
      this.width,
      this.onPressed,
      this.withBorder=false,
      this.shadowColor,
      this.spreadRadius=1.0,
      this.borderRadius})
      : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? width! * .02),
              ),
              border:withBorder!? Border.all(
                  color: AppColors.grey[50]!, width: 1.5
              ):null,
              boxShadow: [
                BoxShadow(
                  color: shadowColor ?? AppColors.blue[50]!.withOpacity(0.2),
                  spreadRadius: spreadRadius!,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                )
              ]),
          child: FlatButton(
            child: child!,
            textColor: textColor ?? AppColors.white,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(borderRadius ?? width! * .02)),
            onPressed: onPressed ?? () {},
          ),
        ));
  }
}
