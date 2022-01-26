import 'package:dukkantek_test/utils/utl_device.dart';
import 'package:flutter/material.dart';


class HorizontalPadding extends StatelessWidget {
  final double percentage;

  const HorizontalPadding({Key? key, this.percentage=.1})
      :
        assert(percentage>=0 || percentage>1),super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.getScaledSize(context, percentage) ;
    return SizedBox(width: width);
  }
}
