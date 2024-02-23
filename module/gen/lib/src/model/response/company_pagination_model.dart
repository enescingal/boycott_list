// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:gen/src/model/response/company_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'company_pagination_model.g.dart';

@JsonSerializable()
class CompanyPaginationModel extends INetworkModel<CompanyPaginationModel> with EquatableMixin {
  CompanyPaginationModel({
    this.currentPage,
    this.data,
    this.perPage,
    this.total,
  });

  factory CompanyPaginationModel.fromJson(Map<String, dynamic> json) => _$CompanyPaginationModelFromJson(json);
  int? currentPage;
  List<CompanyModel>? data;
  int? perPage;
  int? total;

  @override
  CompanyPaginationModel fromJson(Map<String, dynamic> json) => CompanyPaginationModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CompanyPaginationModelToJson(this);

  @override
  List<Object?> get props => [currentPage, data, perPage, total];

  CompanyPaginationModel copyWith({
    int? currentPage,
    List<CompanyModel>? data,
    int? perPage,
    int? total,
  }) {
    return CompanyPaginationModel(
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
    );
  }
}
