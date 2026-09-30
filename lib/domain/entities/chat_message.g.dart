// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  id: json['id'] as String,
  role: $enumDecode(_$ChatRoleEnumMap, json['role']),
  text: json['text'] as String? ?? '',
  status:
      $enumDecodeNullable(_$ChatMessageStatusEnumMap, json['status']) ??
      ChatMessageStatus.thinking,
  sentAt: json['sentAt'] == null
      ? null
      : DateTime.parse(json['sentAt'] as String),
  context: json['context'] == null
      ? null
      : ChatContext.fromJson(json['context'] as Map<String, dynamic>),
  suggestedReplies:
      (json['suggestedReplies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  biasDetected:
      (json['biasDetected'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  relatedToPortfolio: json['relatedToPortfolio'] as bool?,
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$ChatRoleEnumMap[instance.role]!,
      'text': instance.text,
      'status': _$ChatMessageStatusEnumMap[instance.status]!,
      'sentAt': instance.sentAt?.toIso8601String(),
      'context': instance.context,
      'suggestedReplies': instance.suggestedReplies,
      'biasDetected': instance.biasDetected,
      'relatedToPortfolio': instance.relatedToPortfolio,
    };

const _$ChatRoleEnumMap = {ChatRole.user: 'user', ChatRole.coach: 'coach'};

const _$ChatMessageStatusEnumMap = {
  ChatMessageStatus.thinking: 'thinking',
  ChatMessageStatus.streaming: 'streaming',
  ChatMessageStatus.completed: 'completed',
  ChatMessageStatus.failed: 'failed',
};
