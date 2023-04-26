// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Module _$ModuleFromJson(Map<String, dynamic> json) => Module(
  codeModule: json['codeModule'] as String?,
      moduleValue: (json['moduleValue'] as List<dynamic>?)
          ?.map((e) => ModuleValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModuleToJson(Module instance) => <String, dynamic>{
      'codeModule': instance.codeModule,
      'moduleValue': instance.moduleValue,
    };
