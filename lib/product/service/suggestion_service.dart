import 'package:boycott_list/product/service/interface/suggestion_operation.dart';
import 'package:vexana/vexana.dart';

/// Category Service
final class SuggestionService extends SuggestionOperation {
  ///   CategoryService const
  SuggestionService(INetworkManager<EmptyModel> networkManager) : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;
}
