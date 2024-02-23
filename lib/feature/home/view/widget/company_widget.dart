import 'package:boycott_list/feature/home/view/widget/index.dart';
import 'package:boycott_list/product/widget/index.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// BoycottListWidget class
final class CompanyWidget extends StatelessWidget {
  /// BoycottListWidget const
  const CompanyWidget({
    required this.company,
    super.key,
  });

  /// imageUrl
  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.onlyBottomLow,
      padding: context.padding.low,
      decoration: _decoration(context),
      child: Row(
        children: [
          _image(),
          context.sized.emptySizedWidthBoxLow,
          _name(context),
          _why(context),
        ],
      ),
    );
  }

  IconButton _why(BuildContext context) {
    return IconButton(
      onPressed: () {
        onWhy(context);
      },
      icon: const Icon(
        Icons.help,
        color: ColorName.red,
      ),
    );
  }

  Expanded _name(BuildContext context) {
    return Expanded(
      child: Text(
        company.name ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: context.general.textTheme.titleMedium,
      ),
    );
  }

  CachedImage _image() {
    return CachedImage(
      imageUrl: company.logo ?? '',
    );
  }

  BoxDecoration _decoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        color: ColorName.red,
      ),
      borderRadius: context.border.lowBorderRadius,
    );
  }

  /// whyButtonClicked
  void onWhy(BuildContext context) {
    WhyDialog.show(
      context: context,
      companyModel: company,
    );
  }
}
