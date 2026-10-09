# InvestCoach Russia — Состояние проекта

> Актуально на: 2026-10-09 | Branch: `main` | 96/96 тестов | analyze: 0 issues

## Обзор

Мобильное приложение (Flutter, iOS + Android) для ежедневного общения с ИИ-коучем инвестора через новости российского рынка. Calm Tech + Financial Trust, Voice-First UX, тёмная тема.

**Монетизация:** Free → News+ (149 ₽/мес) → Pro.

---

## Архитектура

```
lib/
├── core/          # тема, роутер, DI, config, network, providers
├── features/      # coach, news, portfolio, learning, profile, auth, theme_selection
├── shared/        # widgets, onboarding state
├── data/          # DTO, mappers, repos (mock + remote), services, sources
└── domain/        # entities (freezed), repositories (abstract), services (abstract)
```

**Слои:** presentation (Riverpod notifiers) → domain (entities, use-cases) → data (REST/WS, DTO, mappers)

**Стек:** flutter_riverpod 3.4, go_router 14, dio 5, freezed 3, hive, speech_to_text, flutter_tts, purchases_flutter 10, firebase_messaging 16, fl_chart, shimmer, flutter_animate

---

## Экраны и навигация

| Путь | Экран | Описание |
|------|-------|----------|
| `/theme` | Выбор темы | 5 расцветок (весна/лето/осень/зима/розовая), показывается при первом запуске |
| `/onboarding` | Онбординг (5 шагов) | Welcome → Имя → Опыт → Цели → Риск+Стиль → анимация создания Coach |
| `/coach` | Coach (главный) | Header, «Сегодня важно», Quick Actions, чат, микрофон, paywall |
| `/news` | Новости | Лента новостей дня, pull-to-refresh, tap → Coach |
| `/portfolio` | Портфель | Сводка, пирт-чарт, позиции, сделки с Instant Trade Feedback |
| `/learning` | Обучение | 4 вкладки: Сегодня / Weekly Reviews / Мои Кейсы / Прогресс |
| `/profile` | Профиль | Тариф, статистика 30д, стиль Coach, push, апгрейд, «О приложении» |

**Нижняя навигация:** 5 вкладок (Coach, Новости, Портфель, Обучение, Профиль) через `ShellRoute`.

**Redirect логика:** тема не выбрана → `/theme`; онбординг не пройден → `/onboarding`; иначе → `/coach`.

---

## Функционал по спринтам

### Спринт 1 — Настройка, онбординг, главный экран ✅

**Онбординг (5 экранов, ≤ 90 сек):**
1. Welcome — ценность приложения, анимация Coach
2. Имя — ввод → создание Firebase-аккаунта → `POST /auth/firebase`
3. Опыт — beginner / intermediate / advanced
4. Цели — мульти-выбор (понимание новостей, контроль bias и т.д.)
5. Риск + стиль общения → анимация создания Coach (≥ 2 с) → `PATCH /users/preferences`

- Флаг «онбординг пройден» — в `shared_preferences`
- Ответы сохраняются локально и передаются на backend

**Главный экран Coach:**
- Header: «Доброе утро, {имя}» + аватар Coach со статусом «Онлайн»
- Акцентная карточка «Сегодня важно» (`GET /news/daily`)
- Quick Actions — горизонтальный скролл чипсов
- Круглая кнопка микрофона (72–80 dp) с ripple-анимацией
- Чат: приветственное сообщение + placeholder; input-бар
- Плавающая мини-карточка портфеля
- Состояния: First Launch, Loading (shimmer), Error, No Internet

**Инфраструктура:**
- GoRouter + ShellRoute (5 вкладок)
- DI: get_it + injectable
- Dio-клиент с Firebase token interceptor
- Централизованный error handler (AppErrorMapper)
- Mock-режим по умолчанию (env-флаг `USE_REAL_SERVICES`)
- Аналитика (PostHog) + Crash reporting (Sentry) — интерфейсы + debug-реализации

---

### Спринт 2 — Голос, чат, streaming ✅

**Voice-First:**
- `SpeechTranscriber` (STT) — speech_to_text, mock для тестов
- `SpeechSynthesizer` (TTS) — flutter_tts, mock
- `VoiceSessionNotifier` — 5 фаз: idle → recording → processing → speaking → done
- `VoiceOverlay` — fullscreen-оверлей с ripple-анимацией, waveform, статусы
- `VoiceButton` — круглая кнопка с ripple, haptic feedback

**Чат + Streaming:**
- `ChatSessionNotifier` — управление сессией, лимит Free (8 Pull/день), paywall trigger
- SSE streaming: `ChatStreamSource` → `SseEventParser` → `ChatStreamEvent` (token/done/error)
- WebSocket: `ChatWebSocket` (wrapper web_socket_channel) + `ChatWsBackoff` (exponential backoff, max 5 retries)
- WS события: `stream_chunk`, `voice_response`, `push_notification`
- `ChatMessageBubble` — пузыри сообщений (user/coach), markdown-поддержка
- `CoachInputBar` — текстовый ввод + кнопка отправки

**Монетизация (лимиты):**
- Free: 8 Pull-запросов/день
- При исчерпании → `PaywallOverlay` (мягкий, с CTA на News+)

---

### Спринт 3 — Новости, Портфель, Paywall, Push ✅

**Экран «Новости»:**
- Лента новостей дня (`GET /news/feed`)
- `NewsCard`: заголовок, summary, source, tags, время
- Pull-to-refresh
- Tap → навигация на `/coach` с контекстом новости
- Состояния: Loading / Error / Empty / Data

**Экран «Портфель»:**
- Сводка: общая стоимость, дневное изменение (₽ + %)
- Пирт-чарт (fl_chart PieChart) — аллокация по классам активов
- Позиции: тикер, название, количество, стоимость, дневное изменение
- Сделки: Instant Trade Feedback — `coachFeedback` + `feedbackTone` (positive/warning)
- Состояния: Loading / Error / Empty / Data

**RevenueCat (подписка):**
- `SubscriptionService` (domain) → `RevenueCatSubscriptionService` (data)
- Entitlement-модель: `news_plus`, `pro`
- `purchase(PurchaseParams.package)` — покупка
- `restorePurchases()` — восстановление
- `logIn(firebaseUid)` — привязка к Firebase
- Listener на entitlement-изменения → `tierChanged` stream
- Paywall + Профиль используют `SubscriptionService.purchase()`

**FCM Push-уведомления:**
- `NotificationService` (domain) → `FcmNotificationService` (data)
- Регистрация FCM-токена при старте
- Foreground-уведомления: callback → навигация
- Категории: `daily_news`, `weekly_review`, `new_lesson`
- Push-тумблеры в Профиле управляют категориями

---

### Спринт 4 — Обучение, Профиль ✅

**Экран «Обучение» (4 вкладки):**
- **Сегодня** — `GET /lessons/recommended`: карточки микро-уроков (title, summary, duration, difficulty)
- **Weekly Reviews** — `GET /weekly-review/current|history`: еженедельные обзоры
- **Мои Кейсы** — `GET /cases`: сохранённые кейсы с coach-разбором
- **Прогресс** — статистика: streak, завершённые уроки, топ-темы

**Экран «Профиль»:**
- Header: аватар, имя, бейдж тарифа (Free/News+/Pro)
- Статистика 30 дней: streak, interactions/day, top topics, bias patterns
- Стиль Coach (переключение)
- Push-настройки (3 категории, тумблеры через NotificationService)
- Тариф: текущий + CTA «Перейти на News+» (через SubscriptionService)
- «О приложении»

**Сущности:** `MicroLesson`, `WeeklyReview`, `SavedCase`, `UserStats`, `UserPreferences`, `SubscriptionStatus`

---

### Темы интерфейса ✅

- Экран выбора темы при первом запуске (`/theme`, `ThemeSelectedFlag`)
- 5 расцветок: весна / лето / осень / зима / розовая
- `ThemePalette`: тёмный тонированный фон + мягкий «землистый» акцент
- `ThemeProvider` (InheritedWidget) + `context.palette` extension
- Фолбэк на `springPalette` для widget-тестов без корневого ThemeProvider
- Все виджеты переведены на `context.palette`

---

## Data Layer

| Репозиторий | Mock | Remote | Эндпоинты |
|---|---|---|---|
| `AuthRepository` | ✅ | ✅ | `POST /auth/firebase` |
| `ChatRepository` | ✅ | ✅ | `POST /chat/completion` (SSE), `POST /chat/voice` |
| `NewsRepository` | ✅ | ✅ | `GET /news/daily`, `GET /news/feed` |
| `PortfolioRepository` | ✅ | ✅ | `GET /portfolio`, `GET /portfolio/history` |
| `LearningRepository` | ✅ | ✅ | `GET /lessons/recommended`, `GET /weekly-review/*`, `GET /cases` |
| `ProfileRepository` | ✅ | ✅ | `GET /users/me`, `PATCH /users/preferences`, `GET /subscription/status` |

**Mock-режим:** `AppConfig.useRealServices = false` (по умолчанию) — все репозитории возвращают реалистичные mock-данные.

---

## Сущности (freezed)

`AppUser`, `UserPreferences`, `SubscriptionStatus`, `UserStats`, `ChatSession`, `ChatMessage`, `ChatContext`, `ChatStreamEvent`, `VoiceSession`, `VoiceResponse`, `DailyNews`, `MicroLesson`, `PortfolioSummary`, `PortfolioPosition`, `Trade`, `WeeklyReview`, `SavedCase`

---

## Тесты (96)

| Модуль | Файл | Тестов |
|--------|------|--------|
| Onboarding | `onboarding_flow_test.dart` | 8 |
| Coach Home | `coach_home_screen_test.dart` | 12 |
| Chat Session | `chat_session_notifier_test.dart` | 10 |
| Voice | `voice_session_notifier_test.dart` | 8 |
| News | `news_screen_test.dart` | 4 |
| Portfolio | `portfolio_screen_test.dart` | 5 |
| Learning | `learning_screen_test.dart` | 12 |
| Profile | `profile_screen_test.dart` | 10 |
| Auth | `auth_repository_test.dart` | 5 |
| Core | `app_config_test.dart`, `error_mapper_test.dart`, `ws_backoff_test.dart` | 11 |
| Theme | `theme_palette_test.dart` | 5 |
| **Итого** | | **96** |

---

## Git

```
2301252 feat(sprint3): RevenueCat + FCM push + тесты News/Portfolio
157cd1e feat(theme): выбор темы (5 расцветок) + приглушённые акценты
f298cf1 Доработан модуль обучения          ← origin/main
fca9677 Готовы все экраны
b9f292e feat(learning,profile): Спринт 4
6d0590e feat(voice): fullscreen-оверлей голосового режима
ce10ba6 feat(voice): voice-инфраструктура
...
```

`main` на **2 коммита** впереди `origin/main` — НЕ запушено.

---

## Что осталось

### Спринт 5 — Полировка, производительность, закрытая бета

- [ ] Производительность: минимизировать rebuild'ы, 60 fps, время открытия экрана ≤ 800 мс
- [ ] Haptic feedback на все ключевые действия (проверить покрытие)
- [ ] Анимации: плавность 60 fps (появление карточек, Hero/SharedAxis, ripple)
- [ ] Accessibility: large tap targets, high contrast, icon-first navigation
- [ ] Оффлайн-режим: graceful degradation, кэш последних данных
- [ ] Push-уведомления: background handling, notification channels (Android)
- [ ] RevenueCat: реальные API keys, sandbox-тестирование
- [ ] Firebase: production config, FCM production
- [ ] Sentry + PostHog: production DSN/keys
- [ ] Widget-тесты: покрытие ≥ 80% (сейчас ~60% бизнес-логики)
- [ ] Интеграционные тесты (integration_test/)
- [ ] Закрытая бета: internal testing, crash-мониторинг, сбор фидбека

### Tech Debt / Backlog

- [ ] `GET /portfolio/summary` — согласовать с backend (сейчас `GET /portfolio`)
- [ ] Chat streaming: реальный backend SSE (сейчас mock)
- [ ] WebSocket reconnect: интеграционные тесты
- [ ] Lottie-анимации (Coach avatar, onboarding)
- [ ] Адаптивность: tablet, foldable
- [ ] Мультиязычность: английский (arb-файлы есть, но только ru заполнен)

---

## Команды

```bash
# Запуск (mock-режим, по умолчанию)
flutter run

# Запуск с реальными сервисами
flutter run --dart-define=USE_REAL_SERVICES=true

# Prod API
flutter run --dart-define=ENV=prod

# Тесты
flutter test

# Analyzer
flutter analyze --no-pub

# Codegen (freezed, json_serializable)
dart run build_runner watch --delete-conflicting-outputs
```
