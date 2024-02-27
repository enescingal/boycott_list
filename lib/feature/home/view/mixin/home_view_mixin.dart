import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:boycott_list/feature/home/view/home_view.dart';
import 'package:boycott_list/feature/home/view_model/home_view_model.dart';
import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:boycott_list/product/init/product_localization.dart';
import 'package:boycott_list/product/service/category_service.dart';
import 'package:boycott_list/product/service/company_service.dart';
import 'package:boycott_list/product/service/manager/index.dart';
import 'package:boycott_list/product/service/suggestion_service.dart';
import 'package:boycott_list/product/state/base/base_state.dart';
import 'package:boycott_list/product/state/container/index.dart';
import 'package:boycott_list/product/utility/constans/enums/rewarded_id.dart';
import 'package:boycott_list/product/widget/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kartal/kartal.dart';

///HomeViewMixin mixin
mixin HomeViewMixin on BaseState<HomeView> {
  late final HomeViewModel _viewModel;
  late final ProductNetworkErrorManager _productNetworkErrorManager;

  /// viewModel
  HomeViewModel get viewModel => _viewModel;

  /// scrollController
  late final ScrollController scrollController = ScrollController()..addListener(_scrollListener);

  /// interstitialAd
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    _viewModel = HomeViewModel(
      categoryOperation: CategoryService(productNetworkManager),
      companyOperation: CompanyService(productNetworkManager),
      suggestionOperation: SuggestionService(productNetworkManager),
    );
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
      context: context,
    );

    viewModel
      ..viewModelInitState()
      ..changeLoading(true);

    _createInterstitialAd();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.searchEditingController.dispose();
    viewModel.companyNameController.dispose();
    viewModel.descriptionController.dispose();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (LoadAdError error) => _interstitialAd = null,
      ),
    );
  }

  /// showInterstitialAd
  void showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    }
  }

  /// getRewardedId
  String get adUnitId {
    if (Platform.isAndroid) return RewardedId.isAndroid.value;
    if (Platform.isIOS) return RewardedId.isIos.value;
    return '';
  }

  /// _scrollListener
  void _scrollListener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      viewModel.getCompanyList(isLoad: true);
    }
  }

  /// ShowLanguage
  Future<void> showLanguage() async {
    await LanguageDialog.show(
      context: context,
      locales: (locales) async {
        await ProductLocalization.updateLanguage(context: context, value: locales);
        await Future.delayed(Duration.zero, () {
          viewModel.viewModelInitState();
        });
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
      if (barcodeText.ext.isNotNullOrNoEmpty && (barcodeText.length > 4 && barcodeText.length < 20)) {
        viewModel.searchEditingController.text = barcodeText;
        await viewModel.scanBarcode(barcodeText);
        if (viewModel.state.companyList.isEmpty) viewModel.companyNameController.text = barcodeText;
      }
    }
  }

  /// ShowBoycott
  void showBoycott() {
    BoycottDialog.show(
      context: context,
      onTap: () async {
        if (viewModel.companyNameController.text.ext.isNotNullOrNoEmpty) {
          final suggestion = await viewModel.saveSuggestion();
          if (suggestion && context.mounted) {
            await context.router.pop();
            await SuccessDialog.show(title: 'title', context: context);
          }
        }
      },
      nameController: viewModel.companyNameController,
      descriptionController: viewModel.descriptionController,
    );
  }
}
