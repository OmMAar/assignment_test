import 'package:dukkantek_test/managers/managers.dart';
import 'package:dukkantek_test/widgets/wdg_net_no_network.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NetworkAwareWidget extends StatelessWidget {
  final Widget child;
  final Widget? noNetworkChild;
  final Widget? networkStatusUnknownChild;

  NetworkAwareWidget(
      {required this.child,
        this.noNetworkChild,
        this.networkStatusUnknownChild});

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    if (connectionStatus == null) {
      return networkStatusUnknownChild ?? SizedBox();
    }
    return connectionStatus == ConnectivityStatus.Offline
        ? noNetworkChild ?? NoNetworkWidget()
        : child;
  }
}
