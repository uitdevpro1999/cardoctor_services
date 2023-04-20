import 'package:cardoctor_services/cardoctor_services.dart';
import 'package:cardoctor_services/src/controller/car_service_controller.dart';
import 'package:cardoctor_services/src/page/car_service/car_service_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/flavor_controler.dart';

enum SdkFlavor { STAGING,PRODUCTION }
class SdkCarServices{
  final SdkFlavor flavor;
  String? epasstoken;
  String? contractId;
  String? name;
  String? phone;
  String? identifier;
  FlavorController flavorController = Get.put(FlavorController());
  CarServicesController carServicesController = Get.put(CarServicesController());
  SdkCarServices(this.flavor,this.epasstoken,this.contractId,this.name,this.phone,this.identifier);
  Future open(BuildContext context) async {
    flavorController.getFlavor(flavor);
    carServicesController.contractId =contractId;
    carServicesController.name =name;
    carServicesController.phone =phone;
    carServicesController.identifier =identifier;
    carServicesController.epasstoken= epasstoken;
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CarServicePage();
        },
      ),
    );
  }
}