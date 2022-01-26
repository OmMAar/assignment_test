import 'package:flutter/material.dart';

import 'constants.dart';

class AppTextStyle {
  /// BEGINNING OF THE STANDARD TEXT STYLES ---------------------------------
  final headline1 = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.headline1,
    letterSpacing: appLetterSpacing.letterSpacingH1,
    fontWeight: AppFontWeight.light,
  );

  final headline2 = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.headline2,
    letterSpacing: appLetterSpacing.letterSpacingH2,
    fontWeight: AppFontWeight.light,
  );

  final headline3 = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.headline3,
    letterSpacing: appLetterSpacing.letterSpacingH3,
    fontWeight: AppFontWeight.light,
  );

  final headline4 = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.headline4,
    letterSpacing: appLetterSpacing.letterSpacingH4,
    fontWeight: AppFontWeight.regular,
  );

  final headline5 = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.headline5,
    letterSpacing: appLetterSpacing.letterSpacingH5,
    fontWeight: AppFontWeight.regular,
  );

  final headline6 = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.headline6,
    letterSpacing: appLetterSpacing.letterSpacingH6,
    fontWeight: AppFontWeight.medium,
  );

  final subTitle1 = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.subtitle1,
    letterSpacing: appLetterSpacing.letterSpacingSub1,
    fontWeight: AppFontWeight.regular,
  );

  final subTitle2 = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.subtitle2,
    letterSpacing: appLetterSpacing.letterSpacingSub2,
    fontWeight: AppFontWeight.medium,
  );

  final body1 = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.body1,
    letterSpacing: appLetterSpacing.letterSpacingBody1,
    fontWeight: AppFontWeight.regular,
  );

  final body2 = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.body2,
    letterSpacing: appLetterSpacing.letterSpacingBody2,
    fontWeight: AppFontWeight.regular,
  );

  final button = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.body2,
    letterSpacing: appLetterSpacing.letterSpacingButton,
    fontWeight: AppFontWeight.medium,
  );

  final caption = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.caption,
    letterSpacing: appLetterSpacing.letterSpacingCaption,
    fontWeight: AppFontWeight.regular,
  );

  final overLine = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.overLine,
    letterSpacing: appLetterSpacing.letterSpacingOverLine,
    fontWeight: AppFontWeight.regular,
  );

  /// END OF THE STANDARD TEXT STYLES ---------------------------------

  final hugeTSBasic = const TextStyle(
    fontSize: AppTextSize.huge,
    color: AppColors.black,
  );

  final largestTSBasic = const TextStyle(
    fontSize: AppTextSize.largest,
    color: AppColors.black,
  );

  final largerTSBasic = const TextStyle(
    fontSize: AppTextSize.larger,
    color: AppColors.black,
  );
  final subLargeTSBasic = const TextStyle(
    fontSize: AppTextSize.subLarge,
    color: AppColors.black,
  );

  final bigTSBasic = const TextStyle(
    fontSize: AppTextSize.big,
  );

  //========================subBig======================================

  final subBigTSBasic = const TextStyle(
    fontSize: AppTextSize.subBig,
  );

  //========================normal======================================

  final normalTSBasic = const TextStyle(
    fontSize: AppTextSize.normal,
  );

//=========================middle======================================

  final middleTSBasic = const TextStyle(
    fontSize: AppTextSize.middle,
  );

  //=========================small======================================

  final smallTSBasic = const TextStyle(
    fontSize: AppTextSize.small,
  );

  //========================min======================================
  final minTSBasic = const TextStyle(
    fontSize: AppTextSize.min,
  );

  //========================sub-min======================================

  final subMinTSBasic = const TextStyle(
    fontSize: AppTextSize.subMin,
  );

  //========================sub-2-min======================================

  final sub2MinTSBasic = const TextStyle(
    fontSize: AppTextSize.sub2Min,
  );

  //========================sub-3-min======================================

  final sub3MinTSBasic = const TextStyle(
    fontSize: AppTextSize.sub3Min,
  );

//================================================================================//

}

AppTextStyle appTextStyle = AppTextStyle();
