import 'package:dukkantek_test/constants/constants.dart';
import 'package:flutter/material.dart';


class UserManagementButton extends StatelessWidget {

  final Color backgroundColor;
  final Color? borderColor;
  final double width;
  final double? height;
  final double? borderRadius;

  final VoidCallback onPressed;
  final Widget child;

  const UserManagementButton({
    Key? key,

    required this.backgroundColor,
    required this.width,
    required this.onPressed,
    required this.child,
    this.height,
    this.borderRadius = 0.0,
    this.borderColor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 45,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
          border: Border.all(
            width: 1.0,
            color:borderColor ?? AppColors.white,
          )
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
