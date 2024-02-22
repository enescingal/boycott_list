import 'package:boycott_list/feature/home/view/widget/index.dart';
import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:boycott_list/product/widget/button/index.dart';
import 'package:boycott_list/product/widget/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// LanguageDialog class
final class WhyDialog extends StatelessWidget {
  /// Constructor for dialog
  const WhyDialog({
    required this.companyModel,
    super.key,
  });

  /// get Company Model
  final Company companyModel;

  ///show

  static Future<void> show({
    required BuildContext context,
    required Company companyModel,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (context) => WhyDialog(
        companyModel: companyModel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NormalDialog(
      title: companyModel.name ?? '',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CachedImage(
            imageUrl: companyModel.image ?? '',
          ),
          context.sized.emptySizedHeightBoxLow,
          Text(companyModel.description ?? ''),
          NormalTextButton(
            title: LocaleKeys.general_button_cancel.tr(),
            color: ColorName.red,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
