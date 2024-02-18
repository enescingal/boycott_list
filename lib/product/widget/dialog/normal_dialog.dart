import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// NormalDialog class
final class NormalDialog extends StatelessWidget {
  /// NormalDialog const
  const NormalDialog({
    required this.title,
    required this.content,
    super.key,
  });

  /// dialog title
  final String title;

  /// content
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          padding: context.padding.normal,
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: context.border.normalBorderRadius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.general.textTheme.titleMedium,
              ),
              context.sized.emptySizedHeightBoxLow,
              content,
            ],
          ),
        ),
      ),
    );
  }
}
