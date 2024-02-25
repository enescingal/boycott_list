import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:boycott_list/product/widget/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// Show a dialog for success
final class SuccessDialog extends StatelessWidget {
  /// Constructor for dialog
  const SuccessDialog({required this.title, super.key});

  /// Title for the dialog
  final String title;

  /// Show the dialog for success
  /// This will always return [true]
  static Future<bool> show({
    required String title,
    required BuildContext context,
  }) async {
    await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (contextSuccess) {
        Future.delayed(
          const Duration(milliseconds: 2300),
          () {
            Navigator.pop(contextSuccess);
          },
        );
        return SuccessDialog(title: title);
      },
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return NormalDialog(
      title: LocaleKeys.dialog_boycott_supportMessage.tr(),
      content: ClipOval(
        child: Assets.images.boycott.image(
          package: 'gen',
          width: context.sized.highValue,
        ),
      ),
    );
  }
}
