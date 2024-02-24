import 'package:boycott_list/feature/home/view/home_view.dart';
import 'package:boycott_list/feature/home/view_model/home_view_model.dart';
import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:boycott_list/product/init/product_localization.dart';
import 'package:boycott_list/product/service/category_service.dart';
import 'package:boycott_list/product/service/company_service.dart';
import 'package:boycott_list/product/service/manager/index.dart';
import 'package:boycott_list/product/state/base/base_state.dart';
import 'package:boycott_list/product/state/container/index.dart';
import 'package:boycott_list/product/widget/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

///HomeViewMixin mixin
mixin HomeViewMixin on BaseState<HomeView> {
  late final HomeViewModel _viewModel;
  late final ProductNetworkErrorManager _productNetworkErrorManager;

  /// viewModel
  HomeViewModel get viewModel => _viewModel;

  /// searchEditingController
  TextEditingController searchEditingController = TextEditingController();

  /// nameController
  TextEditingController nameController = TextEditingController();

  /// descriptionController
  TextEditingController descriptionController = TextEditingController();

  /// scrollController
  late final ScrollController scrollController = ScrollController()..addListener(_scrollListener);

  @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );
    _viewModel = HomeViewModel(
      categoryOperation: CategoryService(productNetworkManager),
      companyOperation: CompanyService(productNetworkManager),
    );

    viewModel
      ..viewModelInitState()
      ..changeLoading(true);
  }

  @override
  void dispose() {
    super.dispose();
    searchEditingController.dispose();
    nameController.dispose();
    descriptionController.dispose();
  }

  /// _scrollListener
  void _scrollListener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      viewModel.getCompanyList(isLoad: true);
    }
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
    if (!viewModel.state.isLoading) {
      final barcodeText = await FlutterBarcodeScanner.scanBarcode(
        '#FFCB2732',
        LocaleKeys.general_button_cancel.tr(),
        true,
        ScanMode.BARCODE,
      );
      searchEditingController.text = barcodeText;
      await viewModel.scanBarcode(barcodeText);
    }
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
}
