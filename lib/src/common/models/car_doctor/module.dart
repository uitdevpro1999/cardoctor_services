import 'package:cardoctor_services/src/common/models/car_doctor/module_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'module.g.dart';

@JsonSerializable()
class Module{
  String? codeModule;
  List<ModuleValue>? moduleValue;
  Module({this.codeModule,this.moduleValue});
  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
  Map<String, dynamic> toJson() => _$ModuleToJson(this);
}