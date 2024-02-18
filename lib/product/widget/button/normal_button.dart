import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// Normal Button class
final class NormalButton extends StatelessWidget {
  /// Normal Button
  const NormalButton({required this.title, required this.onPressed, super.key});

  /// title text
  final String title;

  /// button on pressed
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: context.padding.horizontalNormal + context.padding.verticalLow,
        decoration: BoxDecoration(
          color: ColorName.green,
          borderRadius: context.border.lowBorderRadius,
        ),
        child: Text(
          title,
          style: context.general.textTheme.titleMedium?.copyWith(
            color: ColorName.white,
          ),
        ),
      ),
    );
  }
}
