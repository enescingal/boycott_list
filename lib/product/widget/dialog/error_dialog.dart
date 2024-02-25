import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:boycott_list/product/widget/button/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// ErrorDialog class
class ErrorDialog extends StatelessWidget {
  /// Constructor for dialog
  const ErrorDialog({
    required this.message,
    super.key,
  });

  /// Title for the dialog
  final String message;

  /// Show the dialog for success
  /// This will always return [true]
  static Future<void> show({
    required String message,
    required BuildContext context,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (_) => ErrorDialog(
        message: message,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.vertical(
              top: context.border.normalRadius,
            ),
          ),
          child: Container(
            margin: context.padding.normal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: context.sized.mediumValue,
                  height: context.sized.lowValue / 3,
                  color: ColorName.black,
                ),
                context.sized.emptySizedHeightBoxLow,
                const Icon(Icons.error_outline_rounded, color: ColorName.red),
                context.sized.emptySizedHeightBoxLow3x,
                Text(
                  message,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
                context.sized.emptySizedHeightBoxLow3x,
                NormalTextButton(
                  title: LocaleKeys.general_button_ok.tr(),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
