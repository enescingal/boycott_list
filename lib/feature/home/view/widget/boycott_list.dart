import 'package:boycott_list/feature/home/view/widget/index.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// BoycottListWidget class
final class BoycottListWidget extends StatelessWidget {
  /// BoycottListWidget const
  const BoycottListWidget({
    required this.imageUrl,
    required this.companyName,
    super.key,
  });

  /// imageUrl
  final String imageUrl;

  /// name
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.onlyBottomLow,
      padding: context.padding.normal,
      decoration: _decoration(context),
      child: Row(
        children: [
          _image(),
          context.sized.emptySizedWidthBoxLow,
          _name(context),
        ],
      ),
    );
  }

  Text _name(BuildContext context) {
    return Text(
      companyName,
      style: context.general.textTheme.titleMedium,
    );
  }

  CachedImage _image() {
    return CachedImage(
      imageUrl: imageUrl,
    );
  }

  BoxDecoration _decoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        color: ColorName.red,
      ),
      borderRadius: context.border.lowBorderRadius,
    );
  }
}
