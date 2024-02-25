// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'suggestion_response.g.dart';

@JsonSerializable()
class SuggestionResponse extends INetworkModel<SuggestionResponse> with EquatableMixin {
  SuggestionResponse({
    this.id,
  });

  factory SuggestionResponse.fromJson(Map<String, dynamic> json) => _$SuggestionResponseFromJson(json);
  String? id;

  @override
  SuggestionResponse fromJson(Map<String, dynamic> json) => SuggestionResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SuggestionResponseToJson(this);

  @override
  List<Object?> get props => [id];

  SuggestionResponse copyWith({
    String? id,
  }) {
    return SuggestionResponse(
      id: id ?? this.id,
    );
  }
}
