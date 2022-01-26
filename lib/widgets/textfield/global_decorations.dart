import 'package:dukkantek_test/constants/constants.dart';
import 'package:flutter/material.dart';


abstract class GlobalDecorations {
  static InputDecoration get kNormalFieldInputDecoration => InputDecoration(
      labelStyle: appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
      errorStyle: appTextStyle.subMinTSBasic.copyWith(
        color: Colors.red,
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.mainGray),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.mainGray),
      ));

  static InputDecoration get normalFieldUerManagementNInputDecoration =>
      InputDecoration(
        hintStyle: const TextStyle(color: AppColors.mainGray),
        alignLabelWithHint: true,
        fillColor: AppColors.white,
        filled: true,
        labelStyle: appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
        errorStyle: appTextStyle.subMinTSBasic.copyWith(
          color: Colors.red,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.radius16)),
          borderSide: BorderSide(color: AppColors.white),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.radius16),
          ),
        ),
      );

  static InputDecoration get kBorderFieldInputDecoration => InputDecoration(
        alignLabelWithHint: false,
        labelStyle: appTextStyle.normalTSBasic,
        errorStyle: appTextStyle.subMinTSBasic.copyWith(
          color: Colors.red,
        ),
        filled: false,
      );

  static InputDecoration get underLineVerificationCOdeFieldInputDecoration =>
      InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 4),
          borderRadius: BorderRadius.only(),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 4),
          borderRadius: BorderRadius.only(),
        ),
        filled: false,
        errorStyle: appTextStyle.middleTSBasic.copyWith(
          color: Colors.red,
        ),
      );
}
