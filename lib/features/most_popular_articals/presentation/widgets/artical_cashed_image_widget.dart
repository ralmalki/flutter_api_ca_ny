import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticalCashedImageWidget extends StatelessWidget {
  const ArticalCashedImageWidget({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent,
        ),
        width: 100,
        height: 100,
        padding: EdgeInsets.all(5),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
