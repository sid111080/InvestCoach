/// Токены отступов, скруглений и размеров дизайн-системы.
abstract final class AppDimensions {
  AppDimensions._();

  // Отступы.

  static const double space2xs = 4;
  static const double spaceXs = 8;
  static const double spaceSm = 12;
  static const double spaceMd = 16;
  static const double spaceLg = 20;
  static const double spaceXl = 24;
  static const double spaceXxl = 32;
  static const double spaceXxxl = 48;

  // Скругления (карточный дизайн: 16–24 dp).

  static const double radiusSm = 12;
  static const double radiusMd = 16;
  static const double radiusLg = 20;
  static const double radiusXl = 24;
  static const double radiusFull = 999;

  // Размеры.

  /// Главный CTA приложения — круглая кнопка микрофона (72–80 dp).
  static const double voiceButtonSize = 76;

  /// Стандартный размер аватара Coach.
  static const double coachAvatarSize = 40;

  /// Точка статуса «Онлайн» на аватаре.
  static const double statusDotSize = 10;

  /// Минимальный тап-таргет (accessibility).
  static const double minTapTarget = 48;
}
