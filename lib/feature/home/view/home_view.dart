import 'package:auto_route/auto_route.dart';
import 'package:boycott_list/feature/home/view/mixin/home_view_mixin.dart';
import 'package:boycott_list/feature/home/view/widget/index.dart';
import 'package:boycott_list/feature/home/view_model/home_view_model.dart';
import 'package:boycott_list/feature/home/view_model/state/home_state.dart';
import 'package:boycott_list/product/navigation/app_router.dart';
import 'package:boycott_list/product/state/base/base_state.dart';
import 'package:boycott_list/product/widget/appBar/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

@RoutePage()

/// HomeView Page

final class HomeView extends StatefulWidget {
  /// HomeView
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: GestureDetector(
        onTap: () {
          final currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Scaffold(
          floatingActionButton: _floatingButton(),
          appBar: _appBar(),
          body: _body(),
        ),
      ),
    );
  }

  FloatingActionButton _floatingButton() {
    return FloatingActionButton(
      backgroundColor: ColorName.green,
      child: const Icon(Icons.qr_code_scanner, color: ColorName.white),
      onPressed: () async {
        await onScan();
      },
    );
  }

  NormalAppBar _appBar() {
    return NormalAppBar(
      onTapLanguage: showLanguage,
      onTapBoycott: showBoycott,
    );
  }

  BlocBuilder<HomeViewModel, HomeState> _body() {
    return BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            _searchArea(context),
            _category(context, state),
            _companyList(context, state),
            if (state.isLoading) _loading(context),
          ],
        );
      },
    );
  }

  SizedBox _loading(BuildContext context) {
    return SizedBox(
      width: context.sized.highValue + context.sized.mediumValue,
      child: Assets.lottie.loading.lottie(package: 'gen'),
    );
  }

  SearchArea _searchArea(BuildContext context) {
    return SearchArea(
      searchEditingController: searchEditingController,
      onTapBarcode: () async {
        await onScan();
      },
      onSearch: (String newSearch) {
        viewModel.scanBarcode(newSearch);
      },
    );
  }

  Expanded _companyList(BuildContext context, HomeState state) {
    return Expanded(
      child: Padding(
        padding: context.padding.horizontalNormal,
        child: state.companyList.ext.isNotNullOrEmpty
            ? ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) => CompanyWidget(
                  company: state.companyList[index],
                ),
                itemCount: state.companyList.length,
              )
            : !state.isLoading
                ? EmptyCompanyWidget(
                    onTap: showBoycott,
                  )
                : const SizedBox(),
      ),
    );
  }

  SelectedCategoryContainer _category(BuildContext context, HomeState state) {
    return SelectedCategoryContainer(
      category: state.selectedCategory.name ?? '',
      onTap: () async {
        final selectedCategory = await context.router.push(
          CategoryRoute(categoryList: state.categoryList),
        );
        if (selectedCategory != null) {
          await viewModel.changeSelected(selectedCategory as CategoryModel);
        }
      },
    );
  }
}
