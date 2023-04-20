import 'package:cardoctor_sdk_sos/cardoctor_sdk_sos.dart';
import 'package:cardoctor_services/src/common/widgets/utility_button.dart';
import 'package:cardoctor_services/src/consts.dart';
import 'package:cardoctor_services/src/controller/car_service_controller.dart';
import 'package:cardoctor_services/src/controller/flavor_controler.dart';
import 'package:cardoctor_services/src/page/webview/webview_page.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import '../../common/animations/fade_animation.dart';
import '../../common/widgets/container/gradient_header_container.dart';
import '../../common/widgets/modal/alert_dialog.dart';
import '../../common/widgets/pages/base_page.dart';
import '../../common/widgets/snackbar/snackbbar.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';

class CarServicePage extends StatefulWidget {
  const CarServicePage({Key? key}) : super(key: key);

  @override
  State<CarServicePage> createState() => _CarServicePageState();
}

class _CarServicePageState extends State<CarServicePage>
    with AutomaticKeepAliveClientMixin {
  bool _firstRun = true;
  CarServicesController carServicesController = Get.put(CarServicesController());
  FlavorController flavorController = Get.put(FlavorController());


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _firstRun = false);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final carServiceButtons = [
      UtilityButton(
        icon: Assets.icons.carServiceSos.svg(width: 55.0, height: 55.0,package: Consts.packageName),
        title: 'Cứu hộ 24/7',
        onTap: () async {
          await carServicesController.onGetAccessToken(context);
          if (carServicesController.token != null ||
              carServicesController.token != "") {
            final option = CarDoctorOption(
              bearerToken: carServicesController.token!,
              apiUrl: flavorController.urlAPI.value,
              imageUrl: flavorController.imgURL.value,
              mapKey: flavorController.mapKey.value,
            );
            final sdkSos = CarDoctorSdkSos(option);
            sdkSos.open(context);
          }
        }
      ),
      UtilityButton(
        icon: Assets.icons.carServiceAutopart.svg(width: 55.0, height: 55.0,package: Consts.packageName),
        title: 'Chợ phụ kiện',
        onTap: () async {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebviewPage(title: "Chợ phụ kiện",url: "https://chophukien.cardoctor.com.vn/"),));
        },
      ),
      UtilityButton(
        icon: Assets.icons.carServiceCarfinance.svg(width: 55.0, height: 55.0,package: Consts.packageName),
        title: 'Tài chính Ô tô',
        onTap: () async {
          showAlertDialog(
            context,
            title: 'Tài chính ô tô',
            content: const Text(
              "Tính năng đang trong quá trình phát triển, sẽ được cung cấp trong thời gian sắp tới!",
              textAlign: TextAlign.center,
            ),
            primaryButtonTitle: 'Đóng',
            onPrimaryButtonTap: (context) async {
              Navigator.of(context).pop();
            },
          );
        },
      ),
      UtilityButton(
        icon: Assets.icons.carDoctor.svg(width: 55.0, height: 55.0,package: Consts.packageName),
        title: 'Khám chữa xe',
        onTap: () async {
        showAlertDialog(
          context,
          title: 'Thông báo',
          content: const Text(
            "Để nhận tư vấn chăm sóc xe và sử dụng dịch vụ chẩn đoán bệnh xe miễn phí từ Car Doctor, Quý khách vui long cho phép hệ thống của Tổng Công ty Dịch vụ số Viettel truy vấn thông tin số hợp đồng, số điện thoại và dòng xe khi chuyển hướng tới ứng dụng dịch vụ Car Doctor",
            textAlign: TextAlign.center,
          ),
          primaryButtonTitle: 'Tiếp tục',
          onPrimaryButtonTap: (context) async {
            _createLink();
          },
          secondaryButtonTitle: "Trở lại",
          onSecondaryButtonTap: (context) async{
            Navigator.of(context).pop();
          }
        );
      },
      ),
    ];
    return

      WillPopScope(
      onWillPop: () async => true,
      child: BasePage(
                title: 'Dịch vụ ô tô',
                backgroundColor: ColorName.backgroundAvatar,
                child: Stack(
                  children: [
                    FadeAnimation(
                      delay: 0.5,
                      playAnimation: _firstRun,
                      child: const GradientHeaderContainer(),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 16,
                        ),
                        child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: carServiceButtons.length,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                childAspectRatio: 0.85,
                              ),
                              itemBuilder: (context, index) {
                                return FadeAnimation(
                                  delay: 1 +
                                      (index / (carServiceButtons.length * 2)),
                                  playAnimation: _firstRun,
                                  child: carServiceButtons[index],
                                );
                              },
                            ),
                        ),
                      ),
                  ],
                ),
              ),
    );
  }

  Future<void> _createLink() async {
    String flavor;
    switch (flavorController.flavors.value) {
      case "prod":
        {
          flavor = "com.mfunctions.driver.prod";
          break;
        }
      default:
        {
          flavor = "com.mfunctions.driver.dev";
        }
    }


    String? token =carServicesController.epasstoken;
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("https://epass.cardoctor.com.vn/user?token=$token"),
      uriPrefix: "https://epassxcardoctor.page.link",
      androidParameters: AndroidParameters(
        packageName: flavor,
        minimumVersion: 0,
      ),
      iosParameters: IOSParameters(
        bundleId: flavor,
        appStoreId: '6444058831',
        minimumVersion: '0',
      ),
    );
    final dynamicLink =
    await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);
    launchUrl(
      dynamicLink,
      mode: LaunchMode.externalApplication,
    );
  }
}
