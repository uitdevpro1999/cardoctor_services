import 'dart:convert';

import 'package:cardoctor_services/src/common/models/auth/auth_response.dart';
import 'package:cardoctor_services/src/common/models/car_doctor/module_value.dart';
import 'package:dio/dio.dart' as dao;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import '../common/models/car_doctor/car_doctor_get_otp_request.dart';
import '../common/models/car_doctor/get_common.dart';
import '../common/models/car_doctor/module.dart';
import '../common/widgets/snackbar/snackbbar.dart';
import '../consts.dart';
import 'flavor_controler.dart';

class CarServicesController extends GetxController {
  AuthResponse? authResponse;
  String? token;
  String? errormsg;
  String? contractId;
  String? name;
  String? phone;
  String? identifier;
  String? epasstoken;
  Common? common;
  Rx<bool> isLoading = Rx<bool>(false);
  final formKey = GlobalKey<FormState>();
  FlavorController flavorController = Get.put(FlavorController());
  String defaultMsg = 'Đã xảy ra lỗi. Vui lòng thử lại hoặc liên hệ thông đài 19009080';

   onGetCommon() async{
     try{
       common = await getCommon();
     }
     catch(e){
       print(e);
     }
   }
   String?  onGetText(String moduleCode, String moduleValue){
     final module =
     common?.epass?.firstWhere((element) =>
     element.codeModule == moduleCode,
         orElse: () {
           return Module();
         });
     print(module?.codeModule);
     final value = module?.moduleValue?.firstWhere((element) =>
     element.code == moduleValue,
         orElse: () {
           return ModuleValue();
         });
     print(value);
     return value?.content;
   }
   onGetAccessToken(BuildContext context) async {
     try {
       final source = CarDoctorGetOtpRequest(
           contractId: contractId ?? "",
           name: name ?? "",
           phone: phone ?? "",
           identifier: identifier ?? "",
           isGetToken: true);
       // print("CarDoctor: " + jsonEncode(source));

       final resultGetOtp = await getCarDoctorOtp(
           token: Consts.BASIC_AUTH, source: jsonEncode(source));
       if (resultGetOtp.accessToken != null) {
         token = resultGetOtp.accessToken;
       }
       else {
         showErrorSnackBBar(
           context: context,
           message: defaultMsg,
         );
       }
     }
     catch(e){
       showErrorSnackBBar(
         context: context,
         message: defaultMsg,
       );
     }
  }
  Future<AuthResponse> getCarDoctorOtp({
    required token,
    required source,
  }) async {
    final dio = dao.Dio();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    headers['accept-language'] = 'vi';
    final data = dao.FormData();
    data.files.add(MapEntry(
        'source',
        dao.MultipartFile.fromString(source,
            contentType: MediaType.parse('application/json'))));
    final result = await dio.fetch<String>(_setStreamType<String>(
        dao.Options(method: 'POST', headers: headers, extra: extra)
            .compose(dio.options, '/cms/driver/from-ePass',
            queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: flavorController.urlAPI.value)));
    final value = AuthResponse.fromJson(jsonDecode(result.data!));
    return value;
  }
  Future<Common> getCommon() async {
    final dio = dao.Dio();
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await dio
        .fetch<String>(_setStreamType<dynamic>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
      dio.options,
      '/cms/appparam/get-common-message',
      queryParameters: queryParameters,
      data: _data,
    )
        .copyWith(baseUrl: flavorController.urlAPI.value)));

    final value = Common.fromJson(jsonDecode(_result.data!));
    return value;
  }
  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

}
