// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyListResponse _$CompanyListResponseFromJson(Map<String, dynamic> json) =>
    CompanyListResponse(
      albumId: (json['albumId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      isApplied: json['isApplied'] as bool?,
    );

Map<String, dynamic> _$CompanyListResponseToJson(
        CompanyListResponse instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'isApplied': instance.isApplied,
    };
