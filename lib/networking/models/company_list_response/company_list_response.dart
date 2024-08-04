import 'package:json_annotation/json_annotation.dart';
part 'company_list_response.g.dart';

@JsonSerializable()
class CompanyListResponse {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  bool? isApplied;

  CompanyListResponse(
      {this.albumId, this.id, this.title, this.url, this.thumbnailUrl,this.isApplied});

  factory CompanyListResponse.fromJson(Map<String, dynamic> json) => _$CompanyListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyListResponseToJson(this);
}