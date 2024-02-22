import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'company.g.dart';

@JsonSerializable()
class Company extends INetworkModel<Company> with EquatableMixin {
  Company({this.id, this.name, this.description, this.image});

  /// Get user from json
  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
  final String? id;
  final String? name;
  final String? description;
  final String? image;

  @override
  List<Object?> get props => [id, name, description, image];

  /// User model to map object
  @override
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @override
  Company fromJson(Map<String, dynamic> json) {
    return _$CompanyFromJson(json);
  }

  Company copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
  }) {
    return Company(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
}
