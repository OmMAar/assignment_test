import 'package:dukkantek_test/constants/con_colors.dart';
import 'package:dukkantek_test/constants/con_radius.dart';
import 'package:dukkantek_test/constants/con_text_style.dart';
import 'package:dukkantek_test/utils/utils.dart';
import 'package:dukkantek_test/widgets/wdg_vertical_padding.dart';
import 'package:flutter/material.dart';

class UnExpectedErrorWidget extends StatelessWidget {
  final double? width;
  final Function() callback;

  const UnExpectedErrorWidget({required this.callback,this.width});

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
                Icons.error_outline_outlined,
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
              VerticalPadding(percentage: 0.02,),
              ElevatedButton(
                  onPressed: callback,
                  style:  ElevatedButton.styleFrom(
                    onPrimary: AppColors.darkGreen.withOpacity(0.4),
                    primary: AppColors.darkGreen,
                    // minimumSize: Size(88, 36),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(AppRadius.radius6)),
                    ),
                  ),
                  child: Text(
                    "Try again",
                    style: appTextStyle.smallTSBasic
                        .copyWith(color: AppColors.white),
                  ))
            ],
          ),
        ));
  }
}
