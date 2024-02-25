import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:boycott_list/product/widget/button/index.dart';
import 'package:boycott_list/product/widget/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// LanguageDialog class
final class BoycottDialog extends StatelessWidget {
  /// Constructor for dialog
  const BoycottDialog({
    required this.onTap,
    required this.nameController,
    required this.descriptionController,
    super.key,
  });

  /// onTap
  final VoidCallback onTap;

  /// nameController
  final TextEditingController nameController;

  /// descriptionController
  final TextEditingController descriptionController;

  ///show
  static Future<void> show({
    required BuildContext context,
    required VoidCallback onTap,
    required TextEditingController nameController,
    required TextEditingController descriptionController,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (context) => BoycottDialog(
        descriptionController: descriptionController,
        nameController: nameController,
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NormalDialog(
      title: LocaleKeys.dialog_boycott_title.tr(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NormalInputField(
            focusNode: FocusNode(),
            hintText: LocaleKeys.dialog_boycott_name.tr(),
            controller: nameController,
            validator: (value) {
              if (value.ext.isNullOrEmpty) {
                return LocaleKeys.dialog_boycott_validRequired.tr();
              }
              return null;
            },
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
          ),
          context.sized.emptySizedHeightBoxLow,
          NormalInputField(
            focusNode: FocusNode(),
            hintText: LocaleKeys.dialog_boycott_description.tr(),
            controller: descriptionController,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (value) => onTap,
          ),
          context.sized.emptySizedHeightBoxLow,
          NormalTextButton(
            title: LocaleKeys.general_button_save.tr(),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
