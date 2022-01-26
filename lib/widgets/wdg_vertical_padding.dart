import 'package:dukkantek_test/utils/utl_device.dart';
import 'package:flutter/material.dart';

class VerticalPadding extends StatelessWidget {
  final double percentage;

  const VerticalPadding({Key? key, this.percentage = .1}) :
        assert(percentage>=0 || percentage<1), super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = DeviceUtils.getScaledSize(context, percentage) ;
    return SizedBox(height: height);
  }
}
