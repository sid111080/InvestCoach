// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatContext _$ChatContextFromJson(Map<String, dynamic> json) => _ChatContext(
  type:
      $enumDecodeNullable(_$ChatContextTypeEnumMap, json['type']) ??
      ChatContextType.general,
  newsId: json['newsId'] as String?,
  newsTitle: json['newsTitle'] as String?,
);

Map<String, dynamic> _$ChatContextToJson(_ChatContext instance) =>
    <String, dynamic>{
      'type': _$ChatContextTypeEnumMap[instance.type]!,
      'newsId': instance.newsId,
      'newsTitle': instance.newsTitle,
    };

const _$ChatContextTypeEnumMap = {
  ChatContextType.general: 'general',
  ChatContextType.news: 'news',
};
