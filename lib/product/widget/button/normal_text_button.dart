import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// NormalTextButton class
final class NormalTextButton extends StatelessWidget {
  /// NormalTextButton const
  const NormalTextButton({
    required this.title,
    required this.onTap,
    this.color,
    super.key,
  });

  /// title
  final String title;

  /// onTap
  final VoidCallback onTap;

  /// button color
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: context.general.textTheme.titleMedium?.copyWith(
          color: color ?? ColorName.green,
        ),
      ),
    );
  }
}
