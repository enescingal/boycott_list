import 'package:boycott_list/product/init/config/app_environment.dart';
import 'package:boycott_list/product/service/interface/suggestion_operation.dart';
import 'package:boycott_list/product/service/manager/index.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

/// Category Service
final class SuggestionService extends SuggestionOperation {
  ///   CategoryService const
  SuggestionService(INetworkManager<EmptyModel> networkManager) : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<SuggestionResponse> suggestionCreate({required SuggestionCreate requestSuggestion}) async {
    final response = await _networkManager.send<SuggestionResponse, SuggestionResponse>(
      ProductServicePath.createSuggestion.value,
      parseModel: SuggestionResponse(),
      data: requestSuggestion,
      method: RequestType.POST,
      options: Options(
        headers: {
          'x-api-key': AppEnvironmentItems.apiKey.value,
        },
      ),
    );
    return response.data ?? SuggestionResponse();
  }
}
