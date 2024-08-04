import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CommonNetworkImage extends StatelessWidget {
  final String imgUrl;
  final double height;
  const CommonNetworkImage({super.key, required this.imgUrl, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
shape: BoxShape.circle  ),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imgUrl,

        placeholder: (context, url) =>
        const Center(
            child:
            CupertinoActivityIndicator(
            )),
        errorWidget: (context, url, error) =>
            const Icon(Icons.error),
      ),
    );
  }
}
