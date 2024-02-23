import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// CachedImage class
final class CachedImage extends StatelessWidget {
  /// CachedImage const
  const CachedImage({
    required this.imageUrl,
    super.key,
  });

  /// imageUrl
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sized.mediumValue,
      height: context.sized.mediumValue,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => _decoration(imageProvider),
        placeholder: (context, url) => _placeHolder(),
        errorWidget: (context, url, error) => _error(),
      ),
    );
  }

  Icon _error() {
    return const Icon(
      Icons.error,
    );
  }

  CircularProgressIndicator _placeHolder() {
    return const CircularProgressIndicator(
      strokeWidth: 1,
      color: ColorName.red,
    );
  }

  Container _decoration(ImageProvider<Object> imageProvider) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
