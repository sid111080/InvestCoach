/// Типизированные исключения приложения.
///
/// Каждому коду ошибки backend (`InvestCoach.md`, Error Specification)
/// соответствует один вариант. `userMessage` — готовый текст для UI
/// (без технического жаргона, в поддерживающем тоне).
sealed class AppException implements Exception {
  const AppException({
    required this.errorCode,
    required this.userMessage,
    this.httpStatus,
    this.details,
  });

  /// Код ошибки backend, например `RATE_LIMIT_EXCEEDED`.
  final String errorCode;

  /// Пользовательское сообщение для UI.
  final String userMessage;

  /// HTTP-статус ответа (`null` для сетевых сбоев).
  final int? httpStatus;

  /// Детали из ответа backend (`limit`, `reset_in_seconds`,
  /// `suggest_upgrade`, `upgrade_plan` и т.д.).
  final Map<String, Object?>? details;
}

/// 429 — исчерпан дневной лимит Pull-запросов (Free: 8/сутки).
final class RateLimitExceededException extends AppException {
  const RateLimitExceededException({String? userMessage, super.details})
    : super(
        errorCode: 'RATE_LIMIT_EXCEEDED',
        httpStatus: 429,
        userMessage:
            userMessage ?? 'Вы исчерпали лимит вопросов на сегодня',
      );
}

/// 403 — действие требует подписку News+.
final class SubscriptionRequiredException extends AppException {
  const SubscriptionRequiredException({String? userMessage, super.details})
    : super(
        errorCode: 'SUBSCRIPTION_REQUIRED',
        httpStatus: 403,
        userMessage:
            userMessage ?? 'Эта функция доступна только по подписке News+',
      );
}

/// 401 — требуется авторизация.
final class UnauthorizedException extends AppException {
  const UnauthorizedException({String? userMessage, super.details})
    : super(
        errorCode: 'UNAUTHORIZED',
        httpStatus: 401,
        userMessage: userMessage ?? 'Пожалуйста, войдите в аккаунт',
      );
}

/// 403 — нет доступа к ресурсу.
final class ForbiddenException extends AppException {
  const ForbiddenException({String? userMessage, super.details})
    : super(
        errorCode: 'FORBIDDEN',
        httpStatus: 403,
        userMessage: userMessage ?? 'У вас нет доступа к этому действию',
      );
}

/// 498 — токен Firebase истёк (silent refresh).
final class TokenExpiredException extends AppException {
  const TokenExpiredException({String? userMessage, super.details})
    : super(
        errorCode: 'TOKEN_EXPIRED',
        httpStatus: 498,
        userMessage: userMessage ?? 'Сессия устарела. Обновляем…',
      );
}

/// 504 — LLM не уложилась в время ожидания.
final class LlmTimeoutException extends AppException {
  const LlmTimeoutException({String? userMessage, super.details})
    : super(
        errorCode: 'LLM_TIMEOUT',
        httpStatus: 504,
        userMessage:
            userMessage ??
            'Coach сейчас очень задумался. Попробуйте через минуту',
      );
}

/// 503 — сервис LLM временно недоступен.
final class LlmUnavailableException extends AppException {
  const LlmUnavailableException({String? userMessage, super.details})
    : super(
        errorCode: 'LLM_UNAVAILABLE',
        httpStatus: 503,
        userMessage:
            userMessage ??
            'Coach сейчас очень задумался. Попробуйте через минуту',
      );
}

/// 400 — некорректные параметры запроса.
final class ValidationException extends AppException {
  const ValidationException({String? userMessage, super.details})
    : super(
        errorCode: 'VALIDATION_ERROR',
        httpStatus: 400,
        userMessage: userMessage ?? 'Проверьте введённые данные',
      );
}

/// 404 — ресурс не найден.
final class NotFoundException extends AppException {
  const NotFoundException({String? userMessage, super.details})
    : super(
        errorCode: 'NOT_FOUND',
        httpStatus: 404,
        userMessage: userMessage ?? 'Ничего не найдено',
      );
}

/// 461 — недостаточно виртуальных средств.
final class InsufficientFundsException extends AppException {
  const InsufficientFundsException({String? userMessage, super.details})
    : super(
        errorCode: 'INSUFFICIENT_FUNDS',
        httpStatus: 461,
        userMessage: userMessage ?? 'Недостаточно виртуальных средств',
      );
}

/// Сетевой сбой (нет соединения, таймаут).
final class NoInternetException extends AppException {
  const NoInternetException()
    : super(
        errorCode: 'NO_INTERNET',
        userMessage: 'Вы оффлайн. Coach ответит, когда появится связь',
      );
}

/// Любой другой сбой.
final class UnknownException extends AppException {
  const UnknownException({
    String? userMessage,
    super.httpStatus,
    super.details,
  }) : super(
          errorCode: 'UNKNOWN',
          userMessage: userMessage ?? 'Что-то пошло не так. Попробуйте позже',
        );
}
