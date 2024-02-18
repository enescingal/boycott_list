import 'package:auto_route/auto_route.dart';
import 'package:boycott_list/feature/home/view/mixin/home_view_mixin.dart';
import 'package:boycott_list/feature/home/view/widget/index.dart';
import 'package:boycott_list/feature/home/view_model/home_view_model.dart';
import 'package:boycott_list/feature/home/view_model/state/home_state.dart';
import 'package:boycott_list/product/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: Scaffold(
        floatingActionButton: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.qr_code_scanner),
        ),
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }

  HomeAppBar _appBar() {
    return HomeAppBar(
      onTapLanguage: showLanguage,
      onTapBoycott: () {},
    );
  }

  BlocBuilder<HomeViewModel, HomeState> _body() {
    return BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            _searchArea(context),
            _filter(context),
            _list(context),
          ],
        );
      },
    );
  }

  SearchArea _searchArea(BuildContext context) {
    return SearchArea(
      searchEditingController: searchEditingController,
      onTapBarcode: () {},
    );
  }

  Expanded _list(BuildContext context) {
    return Expanded(
      flex: 12,
      child: Padding(
        padding: context.padding.horizontalNormal,
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) => const BoycottListWidget(
            imageUrl: '',
            companyName: 'CompanyName',
          ),
        ),
      ),
    );
  }

  Expanded _filter(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.padding.onlyBottomLow,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => FilterText(
            onTap: () {
              viewModel.changeSelectedIndex(index);
            },
            selectedIndex: viewModel.state.selectedFilterIndex,
            filterName: 'Filter Name ${index + 1}',
            index: index,
          ),
          itemCount: viewModel.filterList.length,
        ),
      ),
    );
  }
}
