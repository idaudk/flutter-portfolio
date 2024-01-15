import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final String? errorImage;
  final Widget? child;
  final double? height;
  final double? loaderHeight;
  final double? loaderWidth;
  final double? width;
  final BoxFit fit;

  const CustomImage({
    Key? key,
    required this.imageUrl,
    this.errorImage,
    this.child,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.loaderHeight = 35,
    this.loaderWidth = 35,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => Container(
        alignment: Alignment.center,
        height: loaderHeight,
        width: loaderWidth,
        child: Container(
          alignment: Alignment.center,
          height: loaderHeight,
          width: loaderWidth,
          // child will be replaced with loadingAnimation
          // child: SpinKitDualRing(
          //   color: AppColors.primaryColor,
          //   size: loaderSize ?? 25,
          //   lineWidth: loaderWidth ?? 5,
          // ),
          child: const CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) {
        return errorImage != null
          ? Image.asset(errorImage!)
          : const Icon(
              Icons.error,
              color: Colors.red,
            );
      } 
    );
  }
}
