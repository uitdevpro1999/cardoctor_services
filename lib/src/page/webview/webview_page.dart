import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
import '../../common/animations/fade_animation.dart';
import '../../common/widgets/container/gradient_header_container.dart';
import '../../common/widgets/pages/base_page.dart';
import '../../gen/colors.gen.dart';

class WebviewPage extends StatefulWidget {
  String? title;
  String url;
  WebviewPage({Key? key, this.title, required this.url}) : super(key: key);

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage>
    with AutomaticKeepAliveClientMixin {
  bool isLoading=true;

  bool _firstRun = true;

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
    return WillPopScope(
      onWillPop: () async => true,
      child: BasePage(
        title: widget.title??"",
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
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Stack(
                  children: [
                    WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: widget.url,
                      onPageFinished: (finish) {
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
                    isLoading ? const Center( child: CircularProgressIndicator(),)
                        : Stack(),
                  ],
                ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
