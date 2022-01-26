import 'package:dukkantek_test/constants/con_colors.dart';
import 'package:dukkantek_test/constants/con_radius.dart';
import 'package:dukkantek_test/constants/con_text_style.dart';
import 'package:dukkantek_test/utils/utils.dart';
import 'package:dukkantek_test/widgets/wdg_vertical_padding.dart';
import 'package:flutter/material.dart';

class NoResultWidget extends StatelessWidget {
  final double? width;
  final Function() callback;

  const NoResultWidget({required this.callback,this.width});

  @override
  Widget build(BuildContext context) {
    double widthC = width??DeviceUtils.getScaledWidth(context, 1);
    // double heightC = DeviceUtils.getScaledHeight(context, 1);
    return Container(
        width: widthC,
        decoration: BoxDecoration(
          color: AppColors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.hourglass_empty,
                size: widthC * .5,
                color: AppColors.darkGreen,
              ),
              VerticalPadding(percentage: 0.04,),
              Text("Opps!",
                  textAlign: TextAlign.center,
                  style: appTextStyle.normalTSBasic.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  )),
              VerticalPadding(percentage: 0.02,),
              Text("Something went wrong,\nplease try again.",
                  textAlign: TextAlign.center,
                  style: appTextStyle.middleTSBasic.copyWith(
                    color: AppColors.white,
                  )),

            ],
          ),
        ));
  }
}
