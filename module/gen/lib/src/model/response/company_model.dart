// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel extends INetworkModel<CompanyModel> with EquatableMixin {
  CompanyModel({
    this.id,
    this.name,
    this.description,
    this.logo,
    this.barcodes,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.categoryIds,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);
  String? id;
  String? name;
  String? description;
  String? logo;
  String? barcodes;
  bool? active;
  String? createdAt;
  String? updatedAt;
  String? categoryIds;

  @override
  CompanyModel fromJson(Map<String, dynamic> json) => CompanyModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CompanyModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        logo,
        barcodes,
        active,
        createdAt,
        updatedAt,
        categoryIds,
      ];

  CompanyModel copyWith({
    String? id,
    String? name,
    String? description,
    String? logo,
    String? barcodes,
    bool? active,
    String? createdAt,
    String? updatedAt,
    String? categoryIds,
  }) {
    return CompanyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      logo: logo ?? this.logo,
      barcodes: barcodes ?? this.barcodes,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      categoryIds: categoryIds ?? this.categoryIds,
    );
  }
}
