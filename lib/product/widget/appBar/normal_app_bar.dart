import 'package:auto_route/auto_route.dart';
import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// HomeAppBar class
final class NormalAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// HomeAppBar const
  const NormalAppBar({
    this.onTapLanguage,
    this.onTapBoycott,
    super.key,
    this.showMenu = true,
    this.showBack = false,
  });

  /// LanguageOnTap
  final VoidCallback? onTapLanguage;

  /// onTapBoycott
  final VoidCallback? onTapBoycott;

  /// actions
  final bool showMenu;

  /// actions
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: _title(context),
      leading: showBack
          ? IconButton(
              onPressed: () {
                context.router.back();
              },
              icon: const Icon(Icons.arrow_back_ios),
            )
          : const SizedBox(),
      actions: [
        if (showMenu) _menu(context),
      ],
    );
  }

  Text _title(BuildContext context) {
    return Text(
      LocaleKeys.home_appbarTitle,
      style: context.general.textTheme.titleMedium?.copyWith(
        color: ColorName.white,
      ),
    ).tr();
  }

  SpeedDial _menu(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(color: ColorName.white),
      backgroundColor: Colors.transparent,
      switchLabelPosition: context.locale.toString() == 'ar_AR',
      direction: SpeedDialDirection.down,
      elevation: 0,
      children: [
        _language(),
        _boycott(),
        _ads(),
      ],
    );
  }

  SpeedDialChild _ads() {
    return SpeedDialChild(
      label: LocaleKeys.home_menu_ads.tr(),
      child: const Icon(
        Icons.handshake,
        color: ColorName.green,
      ),
      onTap: () {},
    );
  }

  SpeedDialChild _boycott() {
    return SpeedDialChild(
      label: LocaleKeys.home_menu_boycottSuggest.tr(),
      child: const Icon(
        Icons.back_hand_outlined,
        color: ColorName.red,
      ),
      onTap: onTapBoycott,
    );
  }

  SpeedDialChild _language() {
    return SpeedDialChild(
      label: LocaleKeys.home_menu_language.tr(),
      child: const Icon(
        Icons.language,
        color: ColorName.green,
      ),
      onTap: onTapLanguage,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
