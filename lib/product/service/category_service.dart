import 'package:boycott_list/product/service/interface/category_operation.dart';
import 'package:boycott_list/product/service/manager/index.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

/// Category Service
final class CategoryService extends CategoryOperation {
  ///   CategoryService const
  CategoryService(INetworkManager<EmptyModel> networkManager) : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<List<CategoryModel>> getCategory() async {
    final response = await _networkManager.send<CategoryModel, List<CategoryModel>>(
      ProductServicePath.getCategory.value,
      parseModel: CategoryModel(),
      method: RequestType.GET,
    );
    return response.data ?? [];
  }
}
