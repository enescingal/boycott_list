// Project service path
// ignore_for_file: public_member_api_docs

enum ProductServicePath {
  /// Category
  getCategory('/category'),

  /// Company
  getCompany('/company'),

  /// Suggestion
  createSuggestion('/suggestion');

  const ProductServicePath(this.value);

  final String value;

  /// [withQuery] is add query to path
  ///
  /// Example: users/123
  String withQuery(String value) {
    return '${this.value}/$value';
  }
}
