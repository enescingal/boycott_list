import 'package:boycott_list/product/service/interface/suggestion_operation.dart';
import 'package:vexana/vexana.dart';

/// Category Service
final class SuggestionService extends SuggestionOperation {
  ///   CategoryService const
  SuggestionService(INetworkManager<EmptyModel> networkManager) : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  // @override
  // Future<String> suggestionCreate({required SuggestionCreate requestSuggestion}) async {
  //   final response = _networkManager.send<>(
  //     ProductServicePath.createSuggestion.value,
  //     parseModel: '',
  //     method: RequestType.POST,
  //   );
  //   return response.data ?? '';
  // }
}
