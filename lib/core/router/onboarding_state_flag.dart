import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/onboarding/onboarding_state_repository.dart';
import '../providers/repository_providers.dart';

/// Синхронный флаг «онбординг пройден» для redirect в роутере.
///
/// `GoRouter.redirect` — синхронная функция, поэтому держим значение
/// в [ChangeNotifier] и передаём его в `GoRouter.refreshListenable`:
/// при смене флага роутер сам перепроверяет текущий маршрут.
///
/// Начальное значение читаем синхронно из [OnboardingStateRepository]
/// (SharedPreferences отдаёт данные из памяти): это исключает
/// «мигание» онбординга при повторном запуске.
final class OnboardingStateFlag extends ChangeNotifier {
  OnboardingStateFlag(this._completed);

  bool _completed;

  bool get completed => _completed;

  set completed(bool value) {
    if (_completed == value) return;
    _completed = value;
    notifyListeners();
  }
}

/// Провайдер флага.
///
/// Обычный [Provider]: в Riverpod 3 безаргументный
/// `ChangeNotifierProvider` удалён, а инстанс [OnboardingStateFlag]
/// нам нужен именно как [Listenable] для роутера.
final onboardingStateFlagProvider =
    Provider<OnboardingStateFlag>((ref) {
  final repository = ref.watch(onboardingStateRepositoryProvider);
  final flag = OnboardingStateFlag(repository.isCompletedNow);
  // Riverpod 3: `listenManual` удалён, его поведение — у `ref.listen`
  // (подписка живёт, пока существует сам провайдер).
  ref.listen(onboardingCompletedProvider, (previous, next) {
    flag.completed = next.value ?? false;
  });
  return flag;
});
