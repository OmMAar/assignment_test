// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_mdl_signin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponseModel _$SignInResponseModelFromJson(Map<String, dynamic> json) =>
    SignInResponseModel(
      error: json['error'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SignInResponseModelToJson(
        SignInResponseModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'token': instance.token,
    };
