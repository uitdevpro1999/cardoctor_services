import 'package:get/get.dart';
import 'package:cardoctor_services/src/cardoctor_services.dart';

class FlavorController extends GetxController {
  Rx<String> urlAPI = RxString("");
  Rx<String> imgURL =RxString("");
  Rx<String> mapKey =RxString("");
  Rx<String> flavors =RxString("");
  void getFlavor(SdkFlavor flavor){
    switch (flavor)
    {
      case SdkFlavor.STAGING:
        flavors.value ="stg";
        imgURL.value = "https://stg-api.cardoctor.com.vn/cms/files/";
        mapKey.value ="d353070a772a526aa6bf282e766aef16";
        urlAPI.value = "https://stg-api.cardoctor.com.vn";
        break;
      case SdkFlavor.PRODUCTION:
        flavors.value ="prod";
        urlAPI.value="https://api.cardoctor.com.vn";
        imgURL.value = "https://api.cardoctor.com.vn/cms/files/";
        mapKey.value ="d353070a772a526aa6bf282e766aef16";
        break;
      default:
        flavors.value ="stg";
        urlAPI.value ="https://api.cardoctor.com.vn";
        imgURL.value = "https://api.cardoctor.com.vn/cms/files/";
        mapKey.value ="d353070a772a526aa6bf282e766aef16";
    }

  }
}