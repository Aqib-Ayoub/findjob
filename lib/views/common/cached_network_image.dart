import 'package:flutter/material.dart';

class CachedNetworkImage extends StatelessWidget {
  const CachedNetworkImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit,
  });
  final String image;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      //TODO add placeholder
      image,
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
    );
  }
}
