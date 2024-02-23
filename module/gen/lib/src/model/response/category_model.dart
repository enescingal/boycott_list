// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends INetworkModel<CategoryModel> with EquatableMixin {
  CategoryModel({
    this.id,
    this.name,
    this.logo,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  String? id;
  String? name;
  String? logo;
  bool? active;
  String? createdAt;
  String? updatedAt;

  @override
  CategoryModel fromJson(Map<String, dynamic> json) => CategoryModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CategoryModelToJson(this);

  @override
  List<Object?> get props => [id, name, logo, active, createdAt, updatedAt];

  CategoryModel copyWith({
    String? id,
    String? name,
    String? logo,
    bool? active,
    String? createdAt,
    String? updatedAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
