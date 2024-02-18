import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:boycott_list/product/utility/constans/enums/locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// LanguageDialog class
final class LanguageDialog extends StatelessWidget {
  /// Constructor for dialog
  const LanguageDialog({
    required this.locales,
    super.key,
  });

  final Function(Locales) locales;

  ///show
  static Future<void> show({
    required BuildContext context,
    required Function(Locales) locales,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (context) => LanguageDialog(
        locales: locales,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        LocaleKeys.dialog_language_title.tr(),
        textAlign: TextAlign.center,
        style: context.general.textTheme.titleMedium,
      ),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: _language(context, name: 'Türkçe', locale: Locales.tr),
          ),
          Expanded(
            child: _language(context, name: 'English', locale: Locales.en),
          ),
          Expanded(
            child: _language(context, name: 'عربي', locale: Locales.ar),
          ),
        ],
      ),
    );
  }

  TextButton _language(
    BuildContext context, {
    required String name,
    required Locales locale,
  }) {
    return TextButton(
      onPressed: () {
        locales(locale);
        Navigator.pop(context);
      },
      child: Text(
        name,
        style: context.general.textTheme.titleMedium?.copyWith(
          color: ColorName.green,
        ),
      ),
    );
  }
}
