/// Расчёт задержки exponential backoff для переподключения.
///
/// Чистая функция — удобно юнит-тестить: 1с → 2с → 4с → … → 30с.
Duration reconnectBackoff({
  required int attempt,
  Duration base = const Duration(seconds: 1),
  Duration cap = const Duration(seconds: 30),
}) {
  var delay = base;
  var current = attempt;
  while (current > 0 && delay < cap) {
    delay = delay * 2;
    current--;
  }
  return delay > cap ? cap : delay;
}
