import 'package:gen/gen.dart';

/// Suggestion
abstract class SuggestionOperation {
  /// create Suggestion
  Future<SuggestionResponse> suggestionCreate({
    required SuggestionCreate requestSuggestion,
  });
}
