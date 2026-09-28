# QWEN.md — InvestCoach Russia

Мобильное приложение **InvestCoach Russia** (Flutter, iOS + Android): ежедневная привычка общения с персональным ИИ-коучем инвестора через новости российского рынка. Полное ТЗ — в `InvestCoach.md` (корень проекта); этот файл — сводка решений, правил и плана, актуальных для разработки.

> **Важно:** родительский `../QWEN.md` описывает другой проект («Финансовый питомец»). Для проекта `InvestCoach` приоритетен этот файл.

## Ключевые принципы продукта

- **Calm Tech + Financial Trust** — премиальный тёмный UI: спокойный, доверительный, без визуального шума.
- **Voice-First** — голосовой режим одно из главных преимуществ; кнопка микрофона (72–80 dp) — главный CTA приложения.
- **Двойная петля вовлечения** — Push (Coach присылает новость дня) + Pull (пользователь сам задаёт вопросы; Free — 8 Pull-запросов/день).
- **Мягкий тон** — поддерживающее общение, без негативных оценок; bias упоминаются нейтрально.
- **Монетизация** — Free → News+ (149 ₽/мес) → Pro; paywall «мягкий».
- **Цели MVP** — D30 retention ≥ 65%, конверсия Free → News+ ≥ 21%.

## Стек (мобильная часть)

| Назначение | Пакет |
|---|---|
| State management | `flutter_riverpod` 2.5+ (`AsyncNotifierProvider` для всех экранов с асинхронной логикой) |
| Навигация | `go_router` + `ShellRoute` (нижняя навигация, 5 вкладок) |
| Networking | `dio` (+ codegen в стиле retrofit), `web_socket_channel` (свой wrapper) |
| Модели | `freezed` + `json_serializable` (все модели — иммутабельные) |
| Локальное хранилище | `hive` / `hive_flutter`, `shared_preferences` |
| DI | `get_it` + `injectable` |
| Голос | `speech_to_text`, `flutter_tts`, `record`, ElevenLabs (TTS primary) |
| Аналитика / ошибки | `posthog_flutter`, `sentry_flutter`, Firebase (Auth, Analytics, Crashlytics, Remote Config) |
| Покупки | `revenuecat` |
| UI / анимации | `fl_chart` (pie), `shimmer`, `flutter_animate`, `lottie` |

## Архитектура (Feature-First + Clean)

```
lib/
├── core/          # тема, роутер, DI, константы, утилиты, extensions
├── features/      # coach, news, portfolio, learning, profile, auth
├── shared/        # widgets, models, repositories, utils
├── data/          # data sources, DTO, mappers
└── domain/        # entities, use cases, abstract repositories
```

Слои: **presentation** (Riverpod notifiers) → **domain** (entities, use-cases, абстрактные репозитории) → **data** (REST/WS-источники, DTO, мепперы). Виджеты, используемые в 2+ местах — в `shared/widgets`.

## Дизайн-система

Тёмная тема (MVP — только dark):

| Токен | Цвет |
|---|---|
| Background | `#0F172A` |
| Surface | `#1E2937` |
| Primary | `#22C55E` (Emerald) |
| Primary Container | `#166534` |
| Text Primary | `#F1F5F9` |
| Text Secondary | `#94A3B8` |
| Success | `#22C55E` |
| Warning | `#F59E0B` |

- Шрифты: **Satoshi** (заголовки) + **Inter** (текст).
- Карточный дизайн: border-radius 16–24 dp, мягкие тени.
- Все анимации плавные (60 fps): появление карточек, Hero/SharedAxis переходы, «Coach думает», ripple на микрофоне.
- Haptic feedback на все ключевые действия.

## Backend (облачный, разрабатывается отдельной командой)

- Base URL: prod `https://api.investcoach.ru/v1`, dev `https://dev-api.investcoach.ru/v1`.
- Auth: Firebase ID Token в `Authorization: Bearer` (в WebSocket — query-параметр `token`).
- Чат: SSE через `POST /chat/completion` (stream) + WebSocket `wss://…/v1/ws/chat` (`stream_chunk`, `voice_response`, `push_notification`).
- Ключевые REST-эндпоинты (полный список и примеры JSON — в `InvestCoach.md`): `POST /auth/firebase`, `PATCH /users/preferences`, `POST /chat/completion`, `POST /chat/voice`, `GET /news/daily`, `GET /news/feed`, `POST /news/discuss/{id}`, `GET /portfolio`, `POST /portfolio/trade`, `GET /portfolio/history`, `GET /weekly-review/current|history`, `GET /lessons/recommended`, `GET/POST /cases*`, `GET /users/me`, `GET /subscription/status`, `POST /subscription/upgrade`, `PATCH /users/coach-style`, `POST /feedback`.
- **Нестыковка к уточнению:** спецификация экранов использует `GET /portfolio/summary` для мини-карточки на главном экране, а OpenAPI описывает только `GET /portfolio` — согласовать с backend-командой.
- Централизованный error handler: `RATE_LIMIT_EXCEEDED` (429) → мягкий paywall News+; `LLM_TIMEOUT` (504) / `LLM_UNAVAILABLE` (503) → «Coach очень задумался. Попробуйте через минуту» + «Повторить»; `TOKEN_EXPIRED` (498) → silent refresh; все ошибки → Sentry + PostHog (`error_occurred`).
- Backend — не блокирующий фактор: все данные читаются через репозитории, предусмотрен mock-режим (env-флаг) для работы без backend.

## Текущий фокус: Спринт 1 — настройка, онбординг, главный экран

Три задачи, выполнять в этом порядке:

### 1. Настройка проекта + дизайн-система

- `flutter create` + структура папок согласно архитектуре выше.
- `core/theme`: тёмная палитра, типографика (Satoshi + Inter), токены отступов/скруглений.
- Базовые shared-виджеты: карточка, primary-кнопка, `CoachAvatar` (статус «Онлайн»), shimmer-скелетоны, круглая кнопка микрофона с ripple.
- GoRouter + ShellRoute: нижняя навигация с 5 вкладками (Coach, Новости, Портфель, Обучение, Профиль).
- DI-скелет: get_it + injectable; Dio-клиент с Firebase token interceptor; централизованный error handler.
- Инициализация Firebase Auth, PostHog, Sentry.

### 2. Экран онбординга (5 экранов, ≤ 90 секунд)

1. **Welcome** — ценность приложения, анимация Coach.
2. **Имя** — ввод имени → создание Firebase-аккаунта → `POST /auth/firebase`.
3. **Опыт** — `experience_level`: beginner / intermediate / advanced.
4. **Цели** — `main_goals`: мульти-выбор (понимание новостей, контроль bias и т.д.).
5. **Риск + стиль общения** → анимация создания Coach (≥ 2 с) → `PATCH /users/preferences`.

- Флаг «онбординг пройден» — в `shared_preferences`/Hive; при повторном запуске сразу главный экран.
- Ответы сохраняются локально и передаются на backend; Coach использует их в первых сообщениях.
- После завершения backend создаёт учебный портфель на 10 000 ₽ с разумной аллокацией (создаёт сам backend — проверить контракт с командой).
- Состав экранов выведен из полей API (`preferences`) и user stories; финальный дизайн — по Figma (pixel perfect).

### 3. Главный экран Coach (без чата)

- Header: «Доброе утро, {имя}» + аватар Coach со статусом «Онлайн».
- Акцентная карточка **«Сегодня важно»** (`GET /news/daily`, обновляется раз в день) — главная точка входа.
- **Quick Actions** — горизонтальный скролл чипсов с примерами вопросов.
- **Круглая кнопка микрофона** (72–80 dp): ripple-анимация + haptic. В Спринте 1 — stub (визуально работает; реальный voice — Спринт 2).
- Плавающая мини-карточка портфеля (`GET /portfolio/summary`) — появляется при скролле чата вниз.
- Области чата в Спринте 1: приветственное сообщение Coach (First Launch) + placeholder списка; input-бар скрыт/stub.
- Состояния: First Launch, Loading (shimmer), Error, No Internet («Вы оффлайн. Coach ответит, когда появится связь»).

**Definition of Done для Спринта 1:**
- `flutter analyze --no-pub` — 0 предупреждений.
- Онбординг и Home работают против dev-backend (или в mock-режиме, если backend не готов).
- Все строки — в arb-файлах (русский), все модели — freezed, `const` везде, где возможно.
- Widget-тесты навигации онбординга + сохранения предпочтений; покрытие бизнес-логики ≥ 60%.

## План: следующие спринты

- **Спринт 2:** чат + streaming ответов (WebSocket/SSE), Voice-First режим, полная интеграция с backend (WS wrapper с reconnect + exponential backoff).
- **Спринт 3:** экран «Новости» + push-механика, экран «Портфель» + Instant Trade Feedback, лимиты Free (8 Pull/день) + paywall.
- **Спринт 4:** экран «Обучение» (Сегодня / Weekly Reviews / Мои Кейсы / Прогресс), экран «Профиль» + тарифы, push-уведомления.
- **Спринт 5:** полировка, багфикс, производительность, закрытая бета.

## Код-стайл и правила

- Все UI-тексты и комментарии — **на русском**; идентификаторы кода — на английском.
- Все строки UI — в `.arb`-файлах (с первого дня, даже для одного языка).
- Модели — только freezed (иммутабельные); репозитории — абстрактные в domain-слое.
- `const`-конструкторы везде, где возможно.
- `flutter analyze --no-pub` должен проходить без предупреждений до коммита.
- Внешние сервисы — только из утверждённого стека (PostHog, Firebase, Sentry, RevenueCat, ElevenLabs).
- Git: feature branches, Pull Request + Code Review, семантические коммиты (`feat:` / `fix:` / `refactor:` / `test:`).
- Каждый экран: обработать состояния Loading / Empty / Error / No Internet; добавить события PostHog (`screen_viewed` и профильные).

## Риски, о которых помнить

1. **Голосовой режим** — самая сложная часть. В Спринте 1 сделать UI-заготовки (кнопка, fullscreen-оверлей как stub); реальная реализация — Спринт 2.
2. **Задержки LLM** — нужен продуманный экран «Coach думает» с прогрессом (Спринт 2); в Спринте 1 — состояния-заглушки.
3. **Производительность** на средних устройствах (Android 8+): минимизировать rebuild'ы, плавные 60 fps, время открытия экрана ≤ 800 мс.
