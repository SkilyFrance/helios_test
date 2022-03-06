import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final String? name;
  final double? radius;
  const CachedCircleAvatar(
      {Key? key, required this.imageUrl, this.radius, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (BuildContext context, String url) => CircleAvatar(
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.grey[200],
        radius: radius ?? 20,
      ),
      imageBuilder: (BuildContext context, ImageProvider<Object> image) =>
          CircleAvatar(
        foregroundImage: image,
        radius: radius ?? 20,
      ),
      errorWidget: (BuildContext context, String url, dynamic error) =>
          CircleAvatar(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.grey[200],
              radius: radius ?? 20,
              child: const Icon(Icons.error)),
    );
  }
}
