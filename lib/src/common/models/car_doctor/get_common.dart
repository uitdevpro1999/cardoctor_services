import 'package:cardoctor_services/src/common/models/car_doctor/module.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_common.g.dart';

@JsonSerializable()
class Common{
  List<Module>? epass;
  List<Module>? cardoctor;
  List<Module>? cardoctorgarage;
  Common({this.epass,this.cardoctor});
  factory Common.fromJson(Map<String, dynamic> json) => _$CommonFromJson(json);
  Map<String, dynamic> toJson() => _$CommonToJson(this);
}