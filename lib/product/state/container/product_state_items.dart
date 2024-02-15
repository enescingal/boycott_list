import 'package:boycott_list/product/service/manager/index.dart';
import 'package:boycott_list/product/state/container/product_state_container.dart';
import 'package:boycott_list/product/state/view_model/product_view_model.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();

  // static ProductCache get productCache => ProductContainer.read<ProductCache>();
}
