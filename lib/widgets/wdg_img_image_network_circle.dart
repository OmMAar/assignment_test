import 'package:dukkantek_test/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageNetworkCircleWidget extends StatefulWidget {
  final String? imageUrl;
  final double? imageHeight;
  final double? imageWidth;
  final double? imageBorderRadius;
  final bool imageBorderRadiusTopLeft;
  final bool imageBorderRadiusTopRight;
  final bool imageBorderRadiusBottomLeft;
  final bool imageBorderRadiusBottomRight;
  final Color? imagePlaceHolderBackgroundColor;
  final bool isCache;
  final BoxFit boxFit;

  const ImageNetworkCircleWidget({
    Key? key,
    this.boxFit = BoxFit.cover,
    required this.imageUrl,
    this.imageHeight,
    this.imageWidth,
    this.isCache = false,
    this.imageBorderRadius = 0.0,
    this.imageBorderRadiusTopLeft = true,
    this.imageBorderRadiusTopRight = true,
    this.imageBorderRadiusBottomLeft = true,
    this.imageBorderRadiusBottomRight = true,
    this.imagePlaceHolderBackgroundColor ,
  }) : super(key: key);

  @override
  _ImageNetworkCircleWidgetState createState() => _ImageNetworkCircleWidgetState();
}

class _ImageNetworkCircleWidgetState extends State<ImageNetworkCircleWidget>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<ImageNetworkCircleWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            widget.imageBorderRadiusTopLeft ? widget.imageBorderRadius! : 0.0,
          ),
          topRight: Radius.circular(
            widget.imageBorderRadiusTopRight ? widget.imageBorderRadius! : 0.0,
          ),
          bottomLeft: Radius.circular(
            widget.imageBorderRadiusBottomLeft
                ? widget.imageBorderRadius!
                : 0.0,
          ),
          bottomRight: Radius.circular(
            widget.imageBorderRadiusBottomRight
                ? widget.imageBorderRadius!
                : 0.0,
          ),
        ),
        child: SizedBox(
            width: widget.imageWidth,
            height: widget.imageHeight,
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl??"",
              placeholder: (context, url) =>
              Container(
                  color: widget.imagePlaceHolderBackgroundColor,
                  child: const SpinKitPulse(color: AppColors.darkGreen,size: 25.0,)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: widget.imageHeight,
              width: widget.imageWidth,
              fit: widget.boxFit,
            )));
  }

  @override
  bool get wantKeepAlive => true;
}
