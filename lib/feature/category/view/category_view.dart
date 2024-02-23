import 'package:auto_route/auto_route.dart';
import 'package:boycott_list/feature/category/view/view_mixin/category_view_mixin.dart';
import 'package:boycott_list/feature/category/view_model/category_view_model.dart';
import 'package:boycott_list/feature/category/view_model/state/category_state.dart';
import 'package:boycott_list/product/init/language/locale_keys.g.dart';
import 'package:boycott_list/product/state/base/base_state.dart';
import 'package:boycott_list/product/widget/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

@RoutePage()

/// CategoryView Page

final class CategoryView extends StatefulWidget {
  /// CategoryView
  const CategoryView({
    required this.categoryList,
    super.key,
  });

  /// categoryList
  final List<CategoryModel> categoryList;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends BaseState<CategoryView> with CategoryViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: const NormalAppBar(
          showMenu: false,
          showBack: true,
        ),
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<CategoryViewModel, CategoryState>(
      builder: _gridList,
    );
  }

  Column _gridList(BuildContext context, CategoryState state) {
    return Column(
      children: [
        _all(context),
        _list(context, state),
      ],
    );
  }

  Expanded _list(BuildContext context, CategoryState state) {
    return Expanded(
      child: GridView.count(
        padding: context.padding.normal,
        childAspectRatio: 1.5,
        crossAxisCount: 3,
        mainAxisSpacing: context.sized.lowValue,
        crossAxisSpacing: context.sized.lowValue,
        children: [
          ...List.generate(
            state.categoryList.length,
            (index) => _container(context, state, index),
          ),
        ],
      ),
    );
  }

  GestureDetector _all(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.pop<CategoryModel>(
          CategoryModel(
            name: LocaleKeys.home_all.tr(),
          ),
        );
      },
      child: Container(
        width: context.sized.width,
        margin: context.padding.horizontalNormal + context.padding.onlyTopNormal,
        padding: context.padding.horizontalNormal + context.padding.verticalLow,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorName.red,
          ),
          borderRadius: context.border.lowBorderRadius,
        ),
        child: Text(
          LocaleKeys.home_all.tr(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  GestureDetector _container(
    BuildContext context,
    CategoryState state,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        context.router.pop<CategoryModel>(state.categoryList[index]);
      },
      child: Container(
        padding: context.padding.low,
        height: context.sized.normalValue,
        decoration: BoxDecoration(
          border: Border.all(color: ColorName.red),
          borderRadius: context.border.lowBorderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image(state, index),
            _name(state, index),
          ],
        ),
      ),
    );
  }

  Text _name(CategoryState state, int index) {
    return Text(
      state.categoryList[index].name ?? '',
      textAlign: TextAlign.center,
    );
  }

  CachedImage _image(CategoryState state, int index) {
    return CachedImage(
      imageUrl: state.categoryList[index].logo ?? '',
    );
  }
}
