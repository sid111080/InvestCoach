import 'package:flutter/widgets.dart';

/// `true`, если приложение работает в widget-тесте.
///
/// В Flutter 3.47 публичный `debugIsInFlutterTest` убран
/// из `package:flutter/foundation.dart`, поэтому определяем тест
/// по типу биндинга: Flutter подменяет его на
/// `TestWidgetsFlutterBinding` (в production — `WidgetsFlutterBinding`).
///
/// Нужен, чтобы в тестах не запускать бесконечные анимации,
/// на которых `pumpAndSettle` не стабилизируется.
bool get debugIsInFlutterTest =>
    WidgetsBinding.instance.runtimeType.toString()
        .contains('TestWidgetsFlutterBinding');
