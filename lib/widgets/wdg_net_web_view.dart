import 'dart:io';

import 'package:dukkantek_test/utils/utils.dart';
import 'package:dukkantek_test/widgets/wdg_net_offline.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'wdg_app_loading_indicator.dart';
import 'wdg_net_network_aware.dart';


class AppWebView extends StatefulWidget {
  final String? url;
  final String title;

  const AppWebView({Key? key,this.url,required this.title});

  @override
  _AppWebViewState createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {


  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    /// todo --remove print
    AppUtils.appPrint("=====================================================================");
    AppUtils.appPrint("                             WebView Page                             ");
    AppUtils.appPrint("web view page ${widget.title} with url :${widget.url}");
    AppUtils.appPrint("=====================================================================");
  }

  num position = 1;

  @override
  Widget build(BuildContext context) {
    // AppBar appBar = AppUtils.yasAppbar(
    //     title: _getAppBarTitle(),
    //     leading: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: IconButton(
    //         onPressed: () {
    //           if (_drawerController.isOpen != null &&
    //               _drawerController.isOpen!()) {
    //             _drawerController.close!();
    //           } else {
    //             _drawerController.open!();
    //           }
    //         },
    //         icon: const FaIcon(
    //           FontAwesomeIcons.bars,
    //           color: AppColors.white,
    //           size: 18,
    //         ),
    //       ),
    //     ),
    //     centerTitle: true,
    //     actions: [
    //       IconButton(
    //         onPressed: () {},
    //         icon: const FaIcon(
    //           FontAwesomeIcons.user,
    //           color: AppColors.white,
    //           size: 18,
    //         ),
    //       ),
    //       tabController.index != 4
    //           ? IconButton(
    //           onPressed: () {},
    //           icon: const FaIcon(
    //             FontAwesomeIcons.search,
    //             color: AppColors.white,
    //             size: 18,
    //           ))
    //           : Container(),
    //       IconButton(
    //           onPressed: () {},
    //           icon: const FaIcon(
    //             FontAwesomeIcons.bell,
    //             color: AppColors.white,
    //             size: 18,
    //           )),
    //       // IconButton(
    //       //     onPressed: () {
    //       //       _drawerController.open!();
    //       //     },
    //       //     icon: const FaIcon(
    //       //       FontAwesomeIcons.bars,
    //       //       color: AppColors.white,
    //       //       size: 18,
    //       //     )),
    //     ]);
    double widthC = DeviceUtils.getScaledWidth(context, 1);
    double heightC = DeviceUtils.getScaledHeight(context, 1) -
        // appBar.preferredSize.height -
        MediaQuery.of(context).viewPadding.top;

    return Scaffold(

      body: NetworkAwareWidget(
        noNetworkChild: OfflineWidget(callback: () {  },),
        child: IndexedStack(index: position as int, children: <Widget>[
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (value) {
              setState(() {
                position = 1;
              });
            },
            onPageFinished: (value) {
              setState(() {
                position = 0;
              });
            },
          ),
          Container(
            color: Colors.white,
            child: AppLoadingIndicator(size: widthC*.11,),
          ),
        ]),
      ),
    );
  }



  // Widget _createWebViewInitialWidget() {
  //   return Container(
  //     color: Colors.white,
  //     child: Center(
  //       child: AppLoadingIndicator(),
  //     ),
  //   );
  // }
}
