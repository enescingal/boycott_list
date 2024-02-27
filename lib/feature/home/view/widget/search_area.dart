import 'dart:async';

import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:boycott_list/product/widget/input/normal_input_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// SearchArea class
final class SearchArea extends StatelessWidget {
  /// SearchArea const
  SearchArea({
    required this.searchEditingController,
    required this.onTapBarcode,
    required this.onSearch,
    super.key,
  });

  /// searchEditingController
  final TextEditingController searchEditingController;

  /// onTap
  final VoidCallback onTapBarcode;

  /// onSearch
  final Function(String) onSearch;

  /// timer
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.padding.normal,
      decoration: BoxDecoration(
        color: ColorName.green,
        borderRadius: BorderRadius.vertical(
          bottom: context.border.normalRadius,
        ),
      ),
      child: NormalInputField(
        hintText: LocaleKeys.general_input_searchHome.tr(),
        controller: searchEditingController,
        textInputFormatter: [
          FilteringTextInputFormatter.deny(RegExp('^ ')),
        ],
        onChanged: (value) {
          if (_debounce?.isActive ?? false) _debounce!.cancel();
          _debounce = Timer(const Duration(milliseconds: 500), () {
            onSearch(value);
          });
        },
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (value) {
          onSearch(value);
          final currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        suffixIcon: IconButton(
          onPressed: onTapBarcode,
          icon: const Icon(
            Icons.qr_code_scanner_outlined,
          ),
        ),
      ),
    );
  }
}
