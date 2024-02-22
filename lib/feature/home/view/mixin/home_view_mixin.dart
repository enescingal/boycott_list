import 'package:boycott_list/feature/home/view/home_view.dart';
import 'package:boycott_list/feature/home/view_model/home_view_model.dart';
import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:boycott_list/product/init/product_localization.dart';
import 'package:boycott_list/product/state/base/base_state.dart';
import 'package:boycott_list/product/widget/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

///HomeViewMixin mixin
mixin HomeViewMixin on BaseState<HomeView> {
  late final HomeViewModel _viewModel;

  /// viewModel
  HomeViewModel get viewModel => _viewModel;

  /// searchEditingController
  TextEditingController searchEditingController = TextEditingController();

  /// nameController
  TextEditingController nameController = TextEditingController();

  /// descriptionController
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
  }

  /// ShowLanguage
  void showLanguage() {
    LanguageDialog.show(
      context: context,
      locales: (locales) {
        ProductLocalization.updateLanguage(context: context, value: locales);
      },
    );
  }

  /// onScan
  Future<void> onScan() async {
    final barcodeText = await FlutterBarcodeScanner.scanBarcode(
      '#FFCB2732',
      LocaleKeys.general_button_cancel.tr(),
      true,
      ScanMode.BARCODE,
    );
    descriptionController.text = barcodeText;
    await viewModel.getCompanyList(barcode: barcodeText);
  }

  /// ShowBoycott
  void showBoycott() {
    BoycottDialog.show(
      context: context,
      onTap: () {
        checkBoycottValue ? SuccessDialog.show(title: 'title', context: context) : null;
      },
      nameController: nameController,
      descriptionController: descriptionController,
    );
  }

  /// checkBoycottValue name
  bool get checkBoycottValue => nameController.text.ext.isNotNullOrNoEmpty;

  @override
  void dispose() {
    super.dispose();
    searchEditingController.dispose();
    nameController.dispose();
    descriptionController.dispose();
  }
}
