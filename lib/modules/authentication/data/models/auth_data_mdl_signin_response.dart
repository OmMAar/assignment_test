import 'package:json_annotation/json_annotation.dart';
part 'auth_data_mdl_signin_response.g.dart';

@JsonSerializable()
class SignInResponseModel {
  final String? error;
  final String? token;



  SignInResponseModel(
      {this.error,
      this.token});

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseModelToJson(this);
}
