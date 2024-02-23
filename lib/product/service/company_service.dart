import 'package:boycott_list/product/service/interface/company_operation.dart';
import 'package:boycott_list/product/service/manager/index.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana/vexana.dart';

/// Category Service
final class CompanyService extends CompanyOperation {
  ///   CategoryService const
  CompanyService(INetworkManager<EmptyModel> networkManager) : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<CompanyPaginationModel> getCompany({int? page, int? limit, String? search, String? categoryId}) async {
    final queryParameters = <String, dynamic>{};
    if (page != null) queryParameters['page'] = page;
    if (limit != null) queryParameters['limit'] = limit;
    if (search.ext.isNotNullOrNoEmpty) queryParameters['search'] = search;
    if (categoryId.ext.isNotNullOrNoEmpty) queryParameters['category_id'] = categoryId;

    final response = await _networkManager.send<CompanyPaginationModel, CompanyPaginationModel>(
      ProductServicePath.getCompany.value,
      parseModel: CompanyPaginationModel(),
      method: RequestType.GET,
      queryParameters: queryParameters,
    );
    return response.data ?? CompanyPaginationModel();
  }
}
