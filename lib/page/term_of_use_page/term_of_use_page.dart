import 'package:flutter/material.dart';
import 'package:movie_app/commond/commond.dart';
import 'package:movie_app/page/signup_page/sign_up_page.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermOfUse extends StatefulWidget {
  const TermOfUse({super.key});

  @override
  State<TermOfUse> createState() => _TermOfUseState();
}

// final controller = WebViewController()
//   ..setJavaScriptMode(JavaScriptMode.unrestricted)
//   ..setBackgroundColor(const Color(0x00000000))
//   ..setNavigationDelegate(
//     NavigationDelegate(
//       onProgress: (int progress) {},
//       onPageStarted: (String url) {},
//       onPageFinished: (String url) {},
//       onWebResourceError: (WebResourceError error) {},
//       onNavigationRequest: (NavigationRequest request) {
//         if (request.url.startsWith('https://www.youtube.com/')) {
//           return NavigationDecision.prevent;
//         }
//         return NavigationDecision.navigate;
//       },
//     ),
//   )
//   ..loadRequest(Uri.parse('https://www.cgv.vn/default/terms-conditions/'));

class _TermOfUseState extends State<TermOfUse> {
  WebViewController controller = WebViewController();
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as ArgumentsTermOfUse;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: true,
            leading: GestureDetector(
              onTap: () {
                controller.clearCache();
                // controller.clearLocalStorage();
                WebViewCookieManager().clearCookies();
                Navigator.pop(context);
                // controller.
              },
              child: Icon(
                Icons.close,
                size: 30.s,
                color: CommondColor.blackCommond,
              ),
            ),
            title: Text(data.title,
                style: CommondText.textSize18W600White
                    .copyWith(color: CommondColor.blackCommond)),
            actions: [
              GestureDetector(
                onTap: () async {
                  if (await controller.canGoBack()) {
                    controller.goBack();
                  }
                },
                child: Icon(
                  Icons.reply,
                  size: 30.s,
                  color: CommondColor.blackCommond,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  controller.reload();
                },
                child: Icon(
                  Icons.refresh,
                  size: 30.s,
                  color: CommondColor.blackCommond,
                ),
              ),
            ],
          ),
          body: RefreshIndicator(
              onRefresh: () async {
                Future.delayed(const Duration(seconds: 0));
                controller.reload();
              },
              child: WebViewWidget(
                  controller: WebViewController()
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..setBackgroundColor(const Color(0x00000000))
                    ..setNavigationDelegate(
                      NavigationDelegate(
                        onProgress: (int progress) {},
                        onPageStarted: (String url) {},
                        onPageFinished: (String url) {},
                        onWebResourceError: (WebResourceError error) {},
                        onNavigationRequest: (NavigationRequest request) {
                          if (request.url
                              .startsWith('https://www.youtube.com/')) {
                            return NavigationDecision.prevent;
                          }
                          return NavigationDecision.navigate;
                        },
                      ),
                    )
                    ..loadRequest(Uri.parse(data.linkWeb)))),
        ),
      ),
    );
  }
}
