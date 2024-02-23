import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// EmptyCompanyWidget class
final class EmptyCompanyWidget extends StatelessWidget {
  /// EmptyCompanyWidget const
  const EmptyCompanyWidget({
    required this.onTap,
    super.key,
  });

  /// button clicked
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.lottie.empty.lottie(package: 'gen', width: context.sized.highValue * 3),
        Text(
          LocaleKeys.home_emptyBoycott.tr(),
          textAlign: TextAlign.center,
          style: context.general.textTheme.titleMedium,
        ),
        context.sized.emptySizedHeightBoxLow,
        TextButton(
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.home_menu_boycottSuggest.tr(),
                style: context.general.textTheme.titleMedium?.copyWith(
                  color: ColorName.red,
                ),
              ),
              context.sized.emptySizedWidthBoxLow3x,
              Icon(
                Icons.back_hand_outlined,
                color: ColorName.red,
                size: context.sized.normalValue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
