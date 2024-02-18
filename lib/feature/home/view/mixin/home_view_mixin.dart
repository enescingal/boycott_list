import 'package:boycott_list/feature/home/view/home_view.dart';
import 'package:boycott_list/feature/home/view_model/home_view_model.dart';
import 'package:boycott_list/product/init/product_localization.dart';
import 'package:boycott_list/product/state/base/base_state.dart';
import 'package:boycott_list/product/widget/index.dart';
import 'package:flutter/material.dart';

///HomeViewMixin mixin
mixin HomeViewMixin on BaseState<HomeView> {
  late final HomeViewModel _viewModel;

  /// viewModel
  HomeViewModel get viewModel => _viewModel;

  /// searchEditingController
  TextEditingController searchEditingController = TextEditingController();

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

  @override
  void dispose() {
    super.dispose();
    searchEditingController.dispose();
  }
}
