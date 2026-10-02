import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/services/speech_synthesizer.dart';
import '../../domain/services/speech_transcriber.dart';
import '../analytics/analytics_service.dart';
import '../config/app_config.dart';
import '../di/injection_container.dart';

/// Глобальная конфигурация приложения (доступна из любого виджета).
final appConfigProvider = Provider<AppConfig>((ref) => getIt<AppConfig>());

/// Аналитика приложения (PostHog / debug-реализация из get_it).
final analyticsServiceProvider =
    Provider<AnalyticsService>((ref) => getIt<AnalyticsService>());

/// Распознавание речи (STT) для голосового режима.
final speechTranscriberProvider =
    Provider<SpeechTranscriber>((ref) => getIt<SpeechTranscriber>());

/// Синтез речи (TTS) для озвучивания ответов Coach.
final speechSynthesizerProvider =
    Provider<SpeechSynthesizer>((ref) => getIt<SpeechSynthesizer>());
