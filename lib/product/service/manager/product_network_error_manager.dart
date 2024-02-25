import 'dart:io';

import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:boycott_list/product/widget/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Manage your network error with screen
final class ProductNetworkErrorManager {
  ProductNetworkErrorManager(this.context);
  final BuildContext context;

  void handleError(int value) {
    if (value == HttpStatus.requestTimeout) {
      ErrorDialog.show(
        message: LocaleKeys.general_error_noInternet.tr(),
        context: context,
      );
    } else {
      ErrorDialog.show(
        message: LocaleKeys.general_error_default.tr(),
        context: context,
      );
    }
    //  else {
    //   showDialog<void>(
    //     context: context,
    //     builder: (context) => const Dialog(
    //       child: Text('data'),
    //     ),
    //   );
    // }
  }
}
