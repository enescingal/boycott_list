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
  final CompanyModel companyModel;

  ///show

  static Future<void> show({
    required BuildContext context,
    required CompanyModel companyModel,
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
            size: context.sized.mediumValue * 2,
            imageUrl: companyModel.logo ?? '',
          ),
          context.sized.emptySizedHeightBoxLow,
          if (companyModel.description.ext.isNotNullOrNoEmpty) Text(companyModel.description!),
          if (companyModel.description.ext.isNullOrEmpty)
            Text(
              LocaleKeys.dialog_boycott_noDescription.tr(),
            ),
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
