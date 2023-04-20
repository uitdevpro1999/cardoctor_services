// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_doctor_verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDoctorVerifyOtpResponse _$CarDoctorVerifyOtpResponseFromJson(
        Map<String, dynamic> json) =>
    CarDoctorVerifyOtpResponse(
      access_token: json['access_token'] as String?,
      token_type: json['token_type'] as String?,
      refresh_token: json['refresh_token'] as String?,
      expires_in: json['expires_in'] as int?,
      scope: json['scope'] as String?,
    );

Map<String, dynamic> _$CarDoctorVerifyOtpResponseToJson(
        CarDoctorVerifyOtpResponse instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'refresh_token': instance.refresh_token,
      'expires_in': instance.expires_in,
      'scope': instance.scope,
    };
