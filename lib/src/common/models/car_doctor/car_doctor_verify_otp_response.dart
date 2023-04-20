

import 'package:json_annotation/json_annotation.dart';

part 'car_doctor_verify_otp_response.g.dart';

@JsonSerializable()
class CarDoctorVerifyOtpResponse {
  String? access_token;
  String? token_type;
  String? refresh_token;
  int? expires_in;
  String? scope;

  CarDoctorVerifyOtpResponse(
      {this.access_token,
        this.token_type,
        this.refresh_token,
        this.expires_in,
        this.scope});

  factory CarDoctorVerifyOtpResponse.fromJson(Map<String, dynamic> json) => _$CarDoctorVerifyOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CarDoctorVerifyOtpResponseToJson(this);
}