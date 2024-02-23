import 'package:gen/gen.dart';

/// CategoryOperation
abstract class CompanyOperation {
  /// get List
  Future<CompanyPaginationModel> getCompany({
    int? page,
    int? limit,
    String? search,
    String? categoryId,
  });
}
