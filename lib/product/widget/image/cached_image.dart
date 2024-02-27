import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// CachedImage class
final class CachedImage extends StatelessWidget {
  /// CachedImage const
  const CachedImage({
    required this.imageUrl,
    this.size,
    super.key,
  });

  /// imageUrl
  final String imageUrl;

  /// size
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? context.sized.mediumValue,
      height: size ?? context.sized.mediumValue,
      child: imageUrl.ext.isNotNullOrNoEmpty
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => _decoration(imageProvider),
              placeholder: (context, url) => _placeHolder(),
              errorWidget: (context, url, error) => _error(context),
            )
          : _error(context),
    );
  }

  Widget _error(BuildContext context) {
    return ClipOval(
      child: Assets.images.boycott.image(package: 'gen'),
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
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
