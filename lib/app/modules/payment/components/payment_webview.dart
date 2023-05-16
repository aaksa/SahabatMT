import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../constants/constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/payment_controller.dart';

class PaymentWebView extends StatefulWidget {
  final String url;
  const PaymentWebView({Key? key, required this.url}) : super(key: key);

  @override
  _PaymentWebViewState createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late final PaymentController paymentController;

  @override
  void initState() {
    super.initState();
    paymentController = Get.find<PaymentController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.SHIPPING_ADDRESS);
            // your custom back button action here
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('MidTrans Payment'),
      ),
      body: Obx(() => Stack(
            children: [
              WebViewWidget(
                controller: WebViewController()
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..setBackgroundColor(const Color(0x00000000))
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onProgress: (int progress) {
// Update loading bar.
                      },
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
                  ..loadRequest(Uri.parse(widget.url)),
              ),
              // WebView(
              //   initialUrl: widget.url,
              //   javascriptMode: JavascriptMode.unrestricted,
              //   onWebViewCreated: (WebViewController webViewController) {
              //     _controller.complete(webViewController);
              //   },
              //   navigationDelegate: (NavigationRequest request) {
              //     if (request.url
              //         .startsWith('https://your-redirect-url.com/')) {
              //       paymentController.payProduk();
              //       Navigator.pop(context);
              //       return NavigationDecision.prevent;
              //     }
              //     return NavigationDecision.navigate;
              //   },
              // ),
              paymentController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(),
            ],
          )),
    );
  }
}
