import 'package:boycott_list/product/service/manager/index.dart';
import 'package:boycott_list/product/state/container/product_state_items.dart';
import 'package:boycott_list/product/state/view_model/product_view_model.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  // ProductNetworkManager get productNetworkManager =>
  //     ProductStateItems.productNetworkManager;

  ProductViewModel get productViewModel => ProductStateItems.productViewModel;
}
