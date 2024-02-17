import 'package:boycott_list/product/widget/input/normal_input_field.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// SearchArea class
final class SearchArea extends StatelessWidget {
  /// SearchArea const
  const SearchArea({
    required this.searchEditingController,
    required this.onTapBarcode,
    super.key,
  });

  /// searchEditingController
  final TextEditingController searchEditingController;

  /// onTap
  final VoidCallback onTapBarcode;

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
        hintText: 'Barkod veya Marka adı yazınız',
        controller: searchEditingController,
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
