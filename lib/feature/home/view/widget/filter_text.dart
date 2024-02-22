/// Created by https://github.com/enescingal on 17/02/2024
library;

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// FilterText class
final class FilterText extends StatelessWidget {
  /// FilterText const
  const FilterText({
    required this.onTap,
    required this.selectedIndex,
    required this.index,
    required this.filterName,
    super.key,
  });

  /// onTap Button
  final VoidCallback onTap;

  /// selectedIndex value
  final int selectedIndex;

  /// index value
  final int index;

  /// filterName value
  final String filterName;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: context.padding.horizontalNormal + (context.padding.onlyBottomLow / 2),
          margin: context.padding.horizontalLow,
          decoration: _decoration(),
          child: _name(context),
        ),
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      border: selectedIndex == index
          ? const Border(
              bottom: BorderSide(color: ColorName.red),
            )
          : const Border(),
    );
  }

  Text _name(BuildContext context) {
    return Text(
      filterName,
      style: context.general.textTheme.titleMedium,
    );
  }
}
