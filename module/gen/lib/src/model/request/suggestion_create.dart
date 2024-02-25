// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'suggestion_create.g.dart';

@JsonSerializable()
class SuggestionCreate extends INetworkModel<SuggestionCreate> with EquatableMixin {
  SuggestionCreate({
    this.description,
    this.name,
  });

  factory SuggestionCreate.fromJson(Map<String, dynamic> json) => _$SuggestionCreateFromJson(json);
  String? description;
  String? name;

  @override
  SuggestionCreate fromJson(Map<String, dynamic> json) => SuggestionCreate.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SuggestionCreateToJson(this);

  @override
  List<Object?> get props => [description, name];

  SuggestionCreate copyWith({
    String? description,
    String? name,
  }) {
    return SuggestionCreate(
      description: description ?? this.description,
      name: name ?? this.name,
    );
  }
}
