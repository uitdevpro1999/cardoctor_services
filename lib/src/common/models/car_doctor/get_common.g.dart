// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Common _$CommonFromJson(Map<String, dynamic> json) => Common(
      epass: (json['epass'] as List<dynamic>?)
          ?.map((e) => Module.fromJson(e as Map<String, dynamic>))
          .toList(),
      cardoctor: (json['cardoctor'] as List<dynamic>?)
          ?.map((e) => Module.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..cardoctorgarage = (json['cardoctorgarage'] as List<dynamic>?)
        ?.map((e) => Module.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$CommonToJson(Common instance) => <String, dynamic>{
      'epass': instance.epass,
      'cardoctor': instance.cardoctor,
      'cardoctorgara': instance.cardoctorgarage,
    };
