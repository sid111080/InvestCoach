import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../analytics/analytics_service.dart';
import '../config/app_config.dart';
import '../di/injection_container.dart';

/// Глобальная конфигурация приложения (доступна из любого виджета).
final appConfigProvider = Provider<AppConfig>((ref) => getIt<AppConfig>());

/// Аналитика приложения (PostHog / debug-реализация из get_it).
final analyticsServiceProvider =
    Provider<AnalyticsService>((ref) => getIt<AnalyticsService>());
