import 'dart:async';
import 'package:dukkantek_test/constants/con_colors.dart';
import 'package:dukkantek_test/constants/con_text_style.dart';
import 'package:dukkantek_test/managers/managers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AppConnectionMonitorWidget extends StatefulWidget {
  final Widget child;

  const AppConnectionMonitorWidget({required this.child});

  @override
  _AppConnectionMonitorWidgetState createState() =>
      _AppConnectionMonitorWidgetState();
}

class _AppConnectionMonitorWidgetState
    extends State<AppConnectionMonitorWidget> {
  // late StreamSubscription _connectionChangeStream;

  bool _isOffline = false;
  bool _isOfflineHlp = false;
  String _messageLabel = "";

  @override
  initState() {
    super.initState();
  }

  void connectionChanged(bool hasConnection) async {
    _isOfflineHlp = !hasConnection;
    if(!_isOffline){
      _isOffline = !hasConnection;
      if(mounted)
        setState(() {});
    }else{

      if(mounted)
        setState(() {});
      await Future.delayed(Duration(seconds: 4), () => {});
      _isOffline = !hasConnection;
      if(mounted)
        setState(() {});
    }

  }

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    connectionChanged(connectionStatus !=ConnectivityStatus.Offline);

    return Material(
      color: _isOfflineHlp ? AppColors.mainGray : AppColors.darkGreen,
      child: Container(
        child: Column(
          children: [
            Expanded(child: widget.child),
            Container(
              color: AppColors.darkGreen,
              child: _isOffline ?AnimatedContainer(
                duration: Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                color: _isOfflineHlp ? AppColors.mainGray : AppColors.darkGreen,
                child: Text(
                  _isOfflineHlp ? "You are offline" : "Back Online",
                  style: appTextStyle.minTSBasic.copyWith(color: AppColors.white),
                ),
              ) : Container(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _connectionChangeStream.cancel();
  }
}
