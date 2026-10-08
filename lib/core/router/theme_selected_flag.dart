import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/theme_provider.dart';

/// Флаг «тема выбрана» для redirect при первом запуске.
final class ThemeSelectedFlag extends ChangeNotifier {
  ThemeSelectedFlag(this._selected);

  bool _selected;

  bool get selected => _selected;

  set selected(bool value) {
    if (_selected == value) return;
    _selected = value;
    notifyListeners();
  }
}

/// Провайдер флага.
///
/// По умолчанию `selected = true` (Spring — дефолтная тема).
/// TODO: для первого запуска — читать из SharedPreferences и ставить `false`.
final themeSelectedFlagProvider = Provider<ThemeSelectedFlag>((ref) {
  final flag = ThemeSelectedFlag(true);
  ref.listen(themePaletteProvider, (previous, next) {
    if (previous != null) {
      flag.selected = true;
    }
  });
  return flag;
});
