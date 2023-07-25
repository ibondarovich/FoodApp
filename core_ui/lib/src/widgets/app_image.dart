import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppImage extends StatelessWidget {
  final String imageURL;
  final double? borderRadius;
  final double width;
  final double height;
  final Alignment alignment;
  final BoxFit? fit;

  const AppImage({
    super.key,
    required this.imageURL,
    this.borderRadius,
    this.width = 200,
    this.height = 200,
    this.alignment = Alignment.center,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CachedNetworkImage(
        alignment: alignment,
        width: width,
        height: height,
        imageUrl: imageURL,
        placeholder: (BuildContext context, String url) => Container(
          child: const AppLoaderWidget(),
        ),
        fit: fit ?? BoxFit.contain,
      ),
    );
  }
}
