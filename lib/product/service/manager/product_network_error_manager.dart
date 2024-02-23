import 'dart:io';

import 'package:flutter/material.dart';

/// Manage your network error with screen
final class ProductNetworkErrorManager {
  ProductNetworkErrorManager(this.context);
  final BuildContext context;

  void handleError(int value) {
    if (value == HttpStatus.unauthorized) {
      //
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
