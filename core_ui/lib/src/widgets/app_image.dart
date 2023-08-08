import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum ImageType {
  png,
  network,
}

class AppImage extends StatelessWidget {
  final String filePath;
  final double? borderRadius;
  final double width;
  final double height;
  final Alignment alignment;
  final BoxFit? fit;
  final double? scale;

  const AppImage({
    super.key,
    required this.filePath,
    this.borderRadius,
    this.width = 200,
    this.height = 200,
    this.alignment = Alignment.center,
    this.fit,
    this.scale,
  });

  ImageType _getImageType(String filePath) {
    if (filePath.endsWith('.png')) {
      return ImageType.png;
    } else {
      return ImageType.network;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (_getImageType(filePath)) {
      case ImageType.network:
        return ClipRRect(
          child: CachedNetworkImage(
            alignment: alignment,
            width: width,
            height: height,
            imageUrl: filePath,
            placeholder: (BuildContext context, String url) => Container(
              child: const AppLoaderWidget(),
            ),
            fit: fit ?? BoxFit.contain,
          ),
        );
      case ImageType.png:
        return ClipRRect(
          child: Container(
            alignment: alignment,
            child: Image.asset(
              filePath,
              fit: fit,
              scale: scale,
            ),
          ),
        );
    }
  }
}
