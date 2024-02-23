/// Created by https://github.com/enescingal on 22/02/2024
library;

import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// SelectedCategoryContainer class
final class SelectedCategoryContainer extends StatelessWidget {
  /// SelectedCategoryContainer const
  const SelectedCategoryContainer({
    required this.category,
    required this.onTap,
    super.key,
  });

  /// category
  final String category;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: context.padding.low + context.padding.horizontalLow,
        padding: context.padding.low,
        width: context.sized.width,
        decoration: BoxDecoration(
          borderRadius: context.border.lowBorderRadius,
          color: ColorName.red,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: context.general.textTheme.bodyMedium?.copyWith(color: ColorName.white),
                  children: [
                    TextSpan(text: '${LocaleKeys.home_selectedCategory.tr()} : '),
                    TextSpan(
                      text: category,
                      style: context.general.textTheme.titleMedium?.copyWith(
                        color: ColorName.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: ColorName.white,
            ),
          ],
        ),
      ),
    );
  }
}
