import 'package:json_annotation/json_annotation.dart';

part 'module_value.g.dart';

@JsonSerializable()
class ModuleValue{
  String? code;
  String? content;
  ModuleValue({this.code,this.content});
  factory ModuleValue.fromJson(Map<String, dynamic> json) => _$ModuleValueFromJson(json);
  Map<String, dynamic> toJson() => _$ModuleValueToJson(this);
}