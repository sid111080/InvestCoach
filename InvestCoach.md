
  
 ## Роль
  Ты — senior Flutter-разработчик.
---  
  ### **ЧАСТЬ 1/4: Общая часть ТЗ + Архитектура + Дизайн-система**  
  
**ТЕХНИЧЕСКОЕ ЗАДАНИЕ**  
**на разработку мобильного приложения InvestCoach Russia (MVP)**  
**Стек: Flutter + Python Backend**  
**Часть 1/4** | Версия 2.0 | 18 сентября 2026  
  
---  
  
### 1. Общая информация  
  
**Название продукта:** InvestCoach Russia  
**Тип:** Мобильное приложение (iOS и Android)  
**Цель MVP:** Создать визуально привлекательное, высокововлекающее приложение с ежедневной привычкой общения с персональным ИИ-коучем через новости российского рынка.  
  
**Ключевые приоритеты продукта:**  
- Максимально приятный и премиальный визуальный стиль (Calm Tech + Financial Trust)  
- Voice-First опыт — голосовой режим должен быть одним из главных преимуществ  
- Двойная петля вовлечения: Push (Coach присылает новости) + Pull (пользователь сам инициирует разговор)  
- Мягкий, поддерживающий, дружественный тон общения (без негативных оценок)  
- Простой и низкопороговый путь перехода с Free на платный тариф News+ (149 ₽/мес)  
  
**Целевые метрики к 31 декабря 2026:**  
- DAU: 1400–1800  
- Среднее количество взаимодействий на 1 DAU: 36–40  
- D30 Retention: ≥ 65%  
- Конверсия Free → News+: ≥ 21%  
  
---  
  
### 2. Технологический стек  
  
**Мобильное приложение:**  
- Flutter 3.24+ (Dart 3.3+)  
- State Management: **Riverpod 2.5** (с AsyncNotifier и AsyncValue)  
- Navigation: **GoRouter** + ShellRoute  
- Networking: **Dio** + retrofit-like generation  
- Local Storage: **Hive** (основной), **SharedPreferences**  
- WebSocket: `web_socket_channel` + собственный wrapper  
- Dependency Injection: **get_it + injectable**  
- Analytics: **PostHog** (главный) + Firebase Analytics  
- Crashlytics: **Sentry** + Firebase Crashlytics  
- Feature Toggles: Firebase Remote Config  
- Voice:  
- Speech-to-Text: `speech_to_text` + Whisper API (fallback)  
- Text-to-Speech: **ElevenLabs** (primary) / Cartesia  
  
**Backend (уже выбран):**  
- Python 3.11 + FastAPI + LangGraph + LangSmith  
- PostgreSQL, Qdrant, Neo4j  
  
---  
  
### 3. Архитектура приложения  
  
**Тип архитектуры:** Feature-First + Clean Architecture (слои: Presentation → Domain → Data)  
  
**Структура проекта:**  
  

```
/lib
├── core/                  # Темы, роутер, DI, константы, утилиты, extensions
├── features/
│   ├── coach/             # Главный экран + чат + голосовой режим
│   ├── news/              # Лента новостей и Push-карточки
│   ├── portfolio/         # Учебный портфель и сделки
│   ├── learning/          # Уроки, Weekly Review, Мои Кейсы
│   ├── profile/           # Профиль, статистика, тарифы
│   └── auth/              # Авторизация
├── shared/
│   ├── widgets/           # Общие компоненты (карточки, кнопки, анимации)
│   ├── models/            # Общие модели
│   ├── repositories/      # Абстрактные репозитории
│   └── utils/├── data/                  # Data Sources, DTO, Mappers
├── domain/                # Entities, UseCases, Repositories (abstract)
└── presentation/          # Riverpod Notifiers, ViewModels
```

  
  
**State Management:** Riverpod (рекомендуется использовать `AsyncNotifierProvider` для большинства экранов).  
  
---  
  
### 4. Дизайн-система и UI/UX требования  
  
**Общий стиль:** Calm Tech + Financial Premium (спокойный, доверительный, современный)  
  
**Цветовая палитра (основная):**  
- Background: `#0F172A` (тёмно-синий)  
- Surface: `#1E2937`  
- Primary: `#22C55E` (Emerald Green)  
- Primary Container: `#166534`  
- Text Primary: `#F1F5F9`  
- Text Secondary: `#94A3B8`  
- Success: `#22C55E`  
- Warning: `#F59E0B`  
  
**Типографика:**  
- Основной шрифт: **Satoshi** (для заголовков) + **Inter** (для текста)  
  
**Обязательные требования к интерфейсу:**  
- Все анимации должны быть плавными и естественными (60 fps+)  
- Большой акцент на карточный дизайн (border-radius 16–24 dp, мягкие тени)  
- Главная кнопка микрофона — самый заметный и удобный элемент интерфейса  
- Высокое качество микровзаимодействий (ripple, scale, haptic feedback)  
- Адаптивность под разные размеры экранов (включая складные устройства)  
  
**Требования к анимациям:**  
- Плавное появление карточек  
- Анимированный переход между экранами (Hero + SharedAxis)  
- Анимация "печати" Coach при генерации ответа  
- Ripple-анимация на кнопке микрофона при голосовом режиме

**Часть 2/4 — Экраны, User Stories и Acceptance Criteria**  
Версия 2.0 | 18 сентября 2026  
  
---  
  
### 5. Детальное описание экранов + User Stories  
  
#### **5.1 Онбординг (5 экранов)**  
  
**User Stories:**  
- US-01: Пользователь должен пройти онбординг быстро и с удовольствием (максимум 90 секунд).  
- US-02: Coach должен "запомнить" ответы пользователя и использовать их в первых сообщениях.  
- US-03: После завершения онбординга пользователь должен сразу попасть на главный экран с приветственным сообщением от Coach.  
  
**Acceptance Criteria:**  
- Онбординг состоит из 5 экранов.  
- Все ответы сохраняются и передаются на backend.  
- Анимация создания Coach на последнем экране (минимум 2 секунды).  
- После завершения автоматически создаётся учебный портфель на 10 000 ₽ с разумной стартовой аллокацией.  
  
---  
  
#### **5.2 Главный экран — «Coach» (Home Screen)**  
  
**Это самый важный экран приложения.**  
  
**Элементы интерфейса:**  
- Header: Приветствие по имени + маленький аватар Coach со статусом «Онлайн»  
- Большая акцентная карточка **«Сегодня важно»** (Push-новость дня) — главная точка входа  
- Основная область чата (с поддержкой bubble, rich content, кнопок выбора уровня разбора)  
- Горизонтальный скролл **Quick Actions** (чипсы с примерами вопросов)  
- Плавающая большая круглая кнопка микрофона (главный CTA приложения, размер ~72–80 dp)  
- Плавающая мини-карточка текущего портфеля (появляется при скролле чата вниз)  
  
**User Stories:**  
- US-04: Пользователь должен видеть персонализированное приветствие и главную новость дня.  
- US-05: Пользователь должен иметь возможность быстро начать разговор голосом или текстом.  
- US-06: Пользователь должен получать мгновенный разбор после каждой сделки.  
- US-07: Пользователь должен иметь удобные быстрые варианты вопросов.  
  
**Acceptance Criteria:**  
- Главная Push-карточка обновляется один раз в день (или при важных событиях).  
- Кнопка микрофона имеет видимую ripple-анимацию и haptic feedback.  
- Чат поддерживает streaming ответов от LLM.  
- При получении нового сообщения от Coach должно быть плавное появление + лёгкая вибрация.  
- Если пользователь на Free-тарифе и исчерпал лимит Pull-запросов — показывается мягкий paywall с предложением News+ за 149 ₽.  
  
**Состояния экрана:**  
- First Launch (приветственное сообщение Coach)  
- Normal Chat  
- Voice Mode Active (fullscreen оверлей)  
- Loading Response (анимация «Coach думает»)  
- Limit Reached (для Free пользователей)  
  
---  
  
#### **5.3 Экран «Новости» (News Feed)**  
  
**Элементы интерфейса:**  
- Top App Bar с заголовком «Новости»  
- Top Tabs: Все / Мой портфель / Корпоративные / Макро / Облигации  
- Список карточек новостей  
- Каждая карточка содержит:  
- Время и источник  
- Заголовок (1–2 строки)  
- Краткое описание (2 строки)  
- Тег влияния на портфель пользователя (зелёный/серый)  
- Кнопка «Обсудить с Coach»  
  
**User Stories:**  
- US-08: Пользователь должен удобно просматривать важные новости рынка.  
- US-09: Пользователь должен одним нажатием переходить к обсуждению новости с Coach (с предзаполненным контекстом).  
  
**Acceptance Criteria:**  
- Лента поддерживает Pull-to-Refresh.  
- При нажатии на кнопку «Обсудить» пользователь переходит в экран Coach с уже загруженным контекстом новости.  
- Новости персонализируются в зависимости от состава портфеля и истории интересов пользователя.  
  
---  
  
#### **5.4 Экран «Портфель»**  
  
**Элементы интерфейса:**  
- Верхний блок: Общая стоимость портфеля + доходность (день/неделя/месяц) с цветовой индикацией  
- Анимированный Pie Chart распределения  
- Список позиций (каждая позиция содержит название, долю, P&L, небольшую метку-разбор от Coach)  
- История последних сделок с коротким комментарием Coach  
- Floating Action Button «+ Новая сделка»  
  
**User Stories:**  
- US-10: Пользователь должен видеть актуальное состояние учебного портфеля.  
- US-11: После совершения сделки должен появляться Instant Feedback от Coach.  
  
**Acceptance Criteria:**  
- Цены обновляются в реальном времени (WebSocket).  
- После подтверждения сделки автоматически открывается карточка разбора (с предложением обсудить голосом).  
- Поддерживаются акции, облигации и ETF Московской Биржи.  
  
---

**Часть 3/4 — Оставшиеся экраны, Аналитика, Производительность и Оффлайн**  
Версия 2.0 | 18 сентября 2026  
  
---  
  
### 5.5 Экран «Обучение» (Learning)  
  
**Структура экрана:** Top Tab Bar с 4 вкладками:  
  
1. **Сегодня** — Рекомендованные микро-уроки  
2. **Weekly Reviews** — История еженедельных разборов  
3. **Мои Кейсы** — Сохранённые разговоры по новостям  
4. **Прогресс** — Статистика и достижения  
  
**Элементы интерфейса:**  
  
**Вкладка "Сегодня":**  
- Карточки микро-уроков (15–60 секунд чтения)  
- Каждая карточка содержит: заголовок, длительность, связанный bias (нейтрально), кнопку «Пройти» и «Обсудить с Coach»  
  
**Вкладка "Weekly Reviews":**  
- Красивая карточка последнего Weekly Review (самая визуально сильная в приложении)  
- Большой круг с Process Score (например 7.8/10)  
- Ключевые insights (3–4 карточки)  
- График прогресса за последние 4 недели  
- Кнопка «Обсудить этот review с Coach»  
  
**Вкладка "Мои Кейсы":**  
- Список сохранённых разговоров по новостям  
- Возможность поиска и фильтрации  
- Каждая карточка содержит дату, тему новости и короткую выдержку  
  
**Вкладка "Прогресс":**  
- Стрики (количество дней подряд общения с Coach)  
- Среднее количество взаимодействий в день  
- Топ-3 темы, которые пользователь чаще всего обсуждает  
- Мягкая визуализация текущих bias-паттернов (без негатива)  
  
**User Stories:**  
- US-12: Пользователь должен легко находить полезные микро-уроки.  
- US-13: Пользователь должен получать красивый и понятный Weekly Review.  
- US-14: Пользователь должен иметь возможность сохранять важные разговоры по новостям.  
  
**Acceptance Criteria:**  
- Weekly Review должен быть одним из самых красивых экранов приложения.  
- Все тексты уроков и разборов должны быть в дружественном, поддерживающем тоне.  
- Сохранённые кейсы открываются обратно в чат с Coach с полным контекстом.  
  
---  
  
### 5.6 Экран «Профиль»  
  
**Элементы интерфейса:**  
  
- Большой header с аватаром пользователя, именем и бейджем текущего тарифа (Free / News+ / Pro)  
- Статистика за последние 30 дней:  
- Текущий streak (дней подряд)  
- Среднее взаимодействий в день  
- Любимые темы обсуждения (в виде облака тегов)  
- Раздел «Мой Coach» — возможность выбрать стиль общения:  
- Спокойный аналитик  
- Поддерживающий ментор  
- Прямолинейный эксперт  
- Настройки push-уведомлений (отдельные переключатели для типов пушей)  
- Большая кнопка «Перейти на News+ за 149 ₽» (если пользователь на Free)  
- Раздел «О приложении» и юридическая информация  
  
**User Stories:**  
- US-15: Пользователь должен видеть свою статистику активности.  
- US-16: Пользователь должен легко понимать преимущества платных тарифов.  
- US-17: Пользователь должен иметь возможность настраивать стиль общения Coach.  
  
**Acceptance Criteria:**  
- При нажатии на кнопку апгрейда открывается красивое сравнение тарифов.  
- Статистика обновляется в реальном времени.  
- Выбор стиля общения Coach сохраняется и влияет на тон ответов.  
  
---  
  
### 6. События аналитики (PostHog Events)  
  
**Обязательные события:**  
  
**Экраны:**  
- `screen_viewed` (с параметром `screen_name`)  
  
**Взаимодействия с Coach:**  
- `chat_message_sent` (text/voice, is_pull_request)  
- `chat_message_received`  
- `voice_session_started`  
- `voice_session_ended`  
- `quick_action_clicked`  
  
**Новости:**  
- `news_card_viewed`  
- `news_discussion_started` (push или pull)  
- `news_discussion_depth` (кратко/глубоко/симуляция)  
  
**Монетизация:**  
- `paywall_shown`  
- `subscription_started` (с параметром `plan`: news_plus / pro)  
- `subscription_cancelled`  
  
**Вовлечённость:**  
- `daily_streak_updated`  
- `weekly_review_opened`  
- `micro_lesson_completed`  
- `case_saved`  
  
**Технические:**  
- `error_occurred`  
- `api_latency`  
- `voice_recognition_failed`  
  
Все события должны содержать параметры: `user_tier` (free/news_plus/pro), `session_id`.  
  
---  
  
### 7. Требования к производительности и оффлайн-режиму  
  
**Производительность:**  
- Время открытия любого экрана ≤ 800 мс  
- Время первого ответа Coach в чате ≤ 2.8 сек (p95)  
- Voice Mode: задержка распознавания речи ≤ 700 мс  
- Приложение должно работать плавно на устройствах среднего сегмента (Android 8+, iPhone XR+)  
  
**Оффлайн-режим:**  
- Просмотр истории чата (последние 30 сообщений)  
- Просмотр учебного портфеля и истории сделок  
- Просмотр сохранённых кейсов и Weekly Reviews  
- Показывается уведомление «Вы оффлайн. Coach ответит, когда появится связь»  
  
---

**Часть 4/4 — Технические требования, пакеты, код-стайл, критерии приёмки и риски**  
Версия 2.0 | 18 сентября 2026  
  
---  
  
### 8. Список рекомендуемых Flutter-пакетов  
  
**Core:**  
- `flutter_riverpod` — State Management  
- `go_router` — Navigation  
- `dio` + `retrofit` — Networking  
- `get_it` + `injectable` — Dependency Injection  
- `hive` + `hive_flutter` — Local Storage  
- `web_socket_channel` — WebSocket соединение  
  
**UI & Animation:**  
- `flutter_animate`  
- `lottie`  
- `glassmorphism` или `neumorphic` (по выбору дизайнера)  
- `fl_chart` или `fl_pie_chart` — графики портфеля  
- `shimmer` — скелетоны загрузки  
  
**Voice & Audio:**  
- `speech_to_text`  
- `flutter_tts`  
- `record` (для записи голоса)  
- `elevenlabs` (официальный пакет или custom)  
  
**Другие важные:**  
- `posthog_flutter` — аналитика  
- `firebase_crashlytics` + `sentry_flutter`  
- `firebase_remote_config`  
- `revenuecat` — In-App Purchases  
- `flutter_native_splash`  
- `flutter_launcher_icons`  
- `intl` — локализация (на будущее)  
  
---  
  
### 9. Требования к код-стайлу и архитектуре  
  
**Обязательные правила:**  
- Использовать **Riverpod 2.0** с `AsyncNotifierProvider` для всех экранов, где есть асинхронная логика.  
- Чёткое разделение слоёв: **Presentation → Domain → Data**  
- Все модели данных должны быть иммутабельными (`freezed` пакет обязателен).  
- Все репозитории должны быть абстрактными (Domain Layer).  
- Код должен проходить `flutter analyze --no-pub` без предупреждений.  
- Все строки должны быть вынесены в `arb` файлы (даже если пока только русский язык).  
- Все виджеты, используемые более чем в одном месте, должны быть вынесены в `shared/widgets`.  
- Использовать `const` везде, где это возможно.  
  
**Git Workflow:**  
- Feature Branch Flow  
- Pull Request + Code Review обязателен  
- Semantic Commit Messages  
  
---  
  
### 10. Критерии приёмки (Definition of Done)  
  
Каждая задача считается выполненной только если:  
  
1. Реализован функционал согласно описанию.  
2. Экран соответствует утверждённому дизайну в Figma (pixel perfect).  
3. Все анимации плавные (60 fps).  
4. Добавлены все необходимые события аналитики PostHog.  
5. Экран протестирован на iPhone 13 и Pixel 7.  
6. Обработаны все состояния (Loading, Empty, Error, No Internet).  
7. Код прошёл Code Review и `flutter analyze`.  
8. Написаны базовые Widget и Integration тесты (минимум покрытие 60% для бизнес-логики).  
9. Документация по экрану обновлена (если требовалась).  
  
---  
  
### 11. План разработки по неделям (для мобильной команды)  
  
**Спринт 1 (14–20 сентября)**  
- Настройка проекта Flutter + дизайн-система  
- Экран Онбординга (все 5 экранов)  
- Главный экран Coach (без чата)  
  
**Спринт 2 (21–27 сентября)**  
- Реализация чата + streaming ответов  
- Голосовой режим (Voice-First)  
- Интеграция с Python backend (WebSocket + REST)  
  
**Спринт 3 (28 сентября – 4 октября)**  
- Экран «Новости» + Push-механика  
- Экран «Портфель» + Instant Trade Feedback  
- Система лимитов Free тарифа  
  
**Спринт 4 (5–11 октября)**  
- Экран «Обучение» (все вкладки)  
- Экран «Профиль» + тарифы  
- Система push-уведомлений  
  
**Спринт 5 (12–15 октября)**  
- Полировка, багфикс, производительность  
- Финальное тестирование  
- Подготовка к Closed Beta  
  
---  
  
### 12. Риски и рекомендации  
  
**Основные риски:**  
1. **Голосовой режим** — самая сложная часть. Нужно начинать работу над ним с первой недели.  
2. **Задержки ответов от LLM** — необходимо реализовать хорошую систему "Coach думает..." с прогресс-баром.  
3. **Согласованность промптов** — мобильная команда должна иметь удобный способ тестировать изменения промптов без перезапуска приложения.  
4. **Производительность на слабых устройствах** — особенно с анимациями и чатом.  

  
---

**Backend API для InvestCoach Russia**  
**С привязкой к экранам мобильного приложения**  
Версия 1.1 | 18 сентября 2026  
  
---  
  
### 1. Общая архитектура взаимодействия  
  
Все запросы от мобильного приложения (Flutter) идут через **единую точку входа** — FastAPI backend.  
BFF-логика (форматирование ответов под мобильное приложение, rate limiting, кэширование) находится внутри тех же эндпоинтов.  
  
---  
  
### 2. API Endpoints с привязкой к экранам мобильного приложения  
  
#### **Auth & Onboarding**  
  
| Endpoint | Метод | Где используется в приложении | Описание |  
|---------|------|-------------------------------|--------|  
| `POST /auth/firebase` | POST | Экран Онбординга (после ввода имени) | Авторизация через Firebase ID Token, создание пользователя |  
| `PATCH /users/preferences` | PATCH | Экран Онбординга (последний шаг) + Профиль → Настройки Coach | Сохранение опыта, целей, отношения к риску, стиля общения |  
  
---  
  
#### **Главный экран — Coach (Home)**  
  
| Endpoint | Метод | Где используется | Описание |  
|---------|------|------------------|--------|  
| `POST /chat/completion` | POST | Главный экран Coach (текстовый ввод) | Основной endpoint для общения с Coach. Поддерживает `stream=true` |  
| `POST /chat/voice` | POST | Главный экран (кнопка микрофона) | Специальный оптимизированный endpoint для голосового режима. Возвращает текст + audio_url |  
| `GET /portfolio/summary` | GET | Плавающая карточка портфеля на главном экране | Краткая сводка портфеля для отображения в чате |  
  
---  
  
#### **Экран «Новости» + Push-уведомления**  
  
| Endpoint | Метод | Где используется | Описание |  
|---------|------|------------------|--------|  
| `GET /news/daily` | GET | Экран Новости + Push "Сегодня важно" | Возвращает персонализированные новости дня |  
| `POST /news/discuss/{news_id}` | POST | Экран Новости → кнопка «Обсудить» + Push-уведомление | Начинает разговор по конкретной новости (предзаполняет контекст) |  
| `GET /news/feed` | GET | Экран «Новости» (лента) | Полная лента новостей с фильтрами |  
  
---  
  
#### **Экран «Портфель»**  
  
| Endpoint | Метод | Где используется | Описание |  
|---------|------|------------------|--------|  
| `GET /portfolio` | GET | Экран Портфель (основная загрузка) | Полное состояние учебного портфеля |  
| `POST /portfolio/trade` | POST | Экран Портфель → "Новая сделка" | Совершение сделки + автоматический Instant Feedback |  
| `GET /portfolio/history` | GET | Экран Портфель (нижняя часть) | История сделок с привязкой к разборам Coach |  
  
---  
  
#### **Экран «Обучение»**  
  
| Endpoint | Метод | Где используется | Описание |  
|---------|------|------------------|--------|  
| `GET /weekly-review/current` | GET | Экран Обучение → Weekly Reviews | Получение текущего Weekly Review |  
| `GET /weekly-review/history` | GET | Экран Обучение → Weekly Reviews | История всех Weekly Reviews |  
| `GET /lessons/recommended` | GET | Экран Обучение → Сегодня | Рекомендованные микро-уроки |  
| `POST /lessons/complete/{lesson_id}` | POST | После прохождения урока | Отметить урок как завершённый |  
| `POST /cases/save` | POST | В чате после разбора новости | Сохранить разговор в «Мои Кейсы» |  
| `GET /cases` | GET | Экран Обучение → Мои Кейсы | Список сохранённых кейсов |  
  
---  
  
#### **Экран «Профиль» и Монетизация**  
  
| Endpoint | Метод | Где используется | Описание |  
|---------|------|------------------|--------|  
| `GET /users/me` | GET | Экран Профиль (загрузка данных) | Полная информация о пользователе + статистика |  
| `GET /subscription/status` | GET | Экран Профиль + при превышении лимита | Текущий тариф, оставшиеся лимиты, срок действия |  
| `POST /subscription/upgrade` | POST | Экран Профиль → кнопка "Перейти на News+" | Инициирует покупку через RevenueCat |  
| `PATCH /users/coach-style` | PATCH | Профиль → «Мой Coach» | Изменение стиля общения Coach |  
  
---  
  
#### **Служебные и технические endpoints**  
  
| Endpoint | Метод | Использование | Описание |  
|---------|------|-------------|--------|  
| `POST /feedback` | POST | После каждого ответа Coach (маленькая кнопка) | Сохранение обратной связи пользователя |  
| `GET /health` | GET | Для мониторинга | Проверка работоспособности сервиса |  
| `GET /memory/summary` | GET | Только для отладки (внутренний доступ) | Краткая сводка памяти пользователя |  
  
---  
  
### 9. Важные технические замечания  
  
- Все чат-эндпоинты (`/chat/completion` и `/chat/voice`) **поддерживают streaming**.  
- Для голосового режима рекомендуется использовать отдельный endpoint `/chat/voice`, так как он возвращает не только текст, но и `audio_url`.  
- Все запросы, связанные с новостями (`/news/discuss`, `/news/daily`), автоматически учитывают состав портфеля пользователя и его историю bias.  
- Rate limiting:  
- Free: 8 Pull-запросов в сутки  
- News+: без ограничений  
- Pro: без ограничений + приоритетная очередь

**BACKEND API SPECIFICATION**  
**InvestCoach Russia**  
**Полная версия с примерами JSON**  
Версия 1.0 | 18 сентября 2026  
  
---  
  
### Общая информация  
  
- **Бэкенд**: Python + FastAPI + LangGraph  
- **Версия API**: `v1`  
- **Base URL**: `https://api.investcoach.ru/v1`  
- **Авторизация**: Firebase ID Token в заголовке `Authorization: Bearer`  
- **Формат**: JSON + Server-Sent Events (для streaming)  
  
---  
  
### 1. Auth & User  
  
#### **POST /v1/auth/firebase**  
  
**Используется**: Экран Онбординга (после ввода имени)  
  
**Request:**  

```
{  "id_token": "eyJhbGciOiJSUzI1NiIs...",  "device_info": {    "platform": "ios",    "version": "18.0",    "model": "iPhone15,2"  }}
```

  
  
**Response 200:**  

```
{  "success": true,  "user": {    "id": "usr_9x4k2m8p",    "name": "Алексей",    "tier": "free",    "created_at": "2026-09-18T08:12:45Z",    "preferences": {      "experience_level": "intermediate",      "main_goals": ["news_understanding", "bias_control"],      "risk_tolerance": "moderate"    }  },  "access_token": "eyJhbGciOiJIUzI1NiIs...",  "refresh_token": "eyJhbGciOiJIUzI1NiIs..."}
```

  
  
---  
  
### 2. Главный экран — Coach  
  
#### **POST /v1/chat/completion**  
  
**Используется**: Главный экран Coach (текстовый чат)  
  
**Request:**  

```
{  "message": "Что думаешь по сегодняшнему росту Сбера?",  "context_type": "news",  "news_id": "news_7843",  "voice_session_id": null,  "stream": true}
```

  
  
**Response (streaming SSE)** — пример одного чанка:  

```
{  "type": "content",  "content": "Сегодня Сбер показал сильный рост после отчётности.",  "is_final": false}
```

  
  
**Финальный ответ:**  

```
{  "type": "final",  "message_id": "msg_9k2m3p7x",  "content": "Сегодня Сбер показал сильный рост... Как ты думаешь, какие сигналы были для тебя самыми важными в этой новости?",  "suggested_actions": [    {"text": "Разобрать подробнее", "action": "deep_analysis"},    {"text": "Связать с моим портфелем", "action": "portfolio_impact"}  ]}
```

  
  
#### **POST /v1/chat/voice**  
  
**Используется**: Главный экран → кнопка микрофона (Voice-First)  
  
**Request:**  

```
{  "audio_base64": "...",  "voice_session_id": "vs_8f3k9p2m",  "context_type": "general"}
```

  
  
**Response:**  

```
{  "transcript": "Какие сегодня новости по Селигдару?",  "response_text": "Сегодня Селигдар отчитался об увеличении производства...",  "audio_url": "https://cdn.investcoach.ru/voice/resp_9k2m3p7x.mp3",  "suggested_replies": [    "Как это влияет на мой портфель?",    "Давай разберём подробнее",    "Сохранить в кейсы"  ],  "bias_detected": ["recency_bias"]}
```

  
  
---  
  
### 3. Новости  
  
#### **GET /v1/news/daily**  
  
**Используется**: Главный экран (Push-карточка) + Экран Новости  
  
**Response:**  

```
{  "news": [    {      "id": "news_7843",      "title": "Сбер отчитался за 8 месяцев: чистая прибыль +34%",      "summary": "Несмотря на рост прибыли, маржа сократилась на 1.8 п.п.",      "impact_on_portfolio": true,      "portfolio_impact_percent": 8.4,      "published_at": "2026-09-18T07:45:12Z",      "tags": ["banking", "earnings"]    }  ]}
```

  
  
#### **POST /v1/news/discuss/{news_id}**  
  
**Используется**: Экран Новости → кнопка «Обсудить», Push-уведомление  
  
**Request:**  

```
{  "level": "deep",                    // "brief", "deep", "simulation", "trade_idea"  "focus_areas": ["portfolio_impact", "bias_analysis"]}
```

  
  
**Response:** (streaming + final) — аналогично `/chat/completion`  
  
---  
  
### 4. Портфель  
  
#### **GET /v1/portfolio**  
  
**Используется**: Экран «Портфель» + плавающая карточка на главном экране  
  
**Response:**  

```
{  "total_value": 127450.80,  "total_value_rub": 12745080,  "daily_change_percent": 1.84,  "daily_change_rub": 234800,  "allocation": {    "stocks": 62.4,    "bonds": 28.1,    "etf": 9.5  },  "positions": [    {      "ticker": "SBER",      "name": "Сбер Банк",      "shares": 1240,      "avg_price": 248.70,      "current_price": 287.45,      "pnl_percent": 15.58,      "weight": 12.4,      "coach_note": "Ты часто следишь за этой бумагой. Сейчас она даёт хороший вклад в портфель."    }  ]}
```

  
  
#### **POST /v1/portfolio/trade**  
  
**Используется**: Экран Портфель → Новая сделка  
  
**Request:**  

```
{  "ticker": "GAZP",  "operation": "buy",  "shares": 300,  "price": 142.80}
```

  
  
**Response:**  

```
{  "success": true,  "trade_id": "trd_8f3k9p",  "coach_feedback": {    "message": "Ты добавил Газпром в портфель. Ранее мы замечали, что ты часто покупаешь после сильного движения цены. Давай вместе посмотрим, какие сигналы ты учитывал?",    "bias_suggested": ["recency_bias", "fomo"],    "quick_replies": ["Разобрать подробнее", "Что было бы лучше сделать?"]  }}
```

  
  
---  
  
### 5. Обучение и Аналитика  
  
#### **GET /v1/weekly-review/current**  
  
**Используется**: Экран Обучение → Weekly Reviews  
  
**Response:** (пример сильно сокращён)  

```
{  "week": "2026-W37",  "process_score": 7.4,  "insights": [    "Ты хорошо реагируешь на позитивные новости, но часто игнорируешь риски",    "FOMO проявлялся 3 раза за неделю"  ],  "portfolio_comparison": {    "your_return": 4.2,    "index_return": 5.1  }}
```

  
  
---  
  
### 6. Монетизация и Профиль  
  
#### **GET /v1/subscription/status**  
  
**Используется**: Экран Профиль + при превышении лимита Pull-запросов  
  
**Response:**  

```
{  "tier": "free",  "pull_requests_left": 3,  "pull_requests_limit": 8,  "news_plus_active": false,  "next_billing_date": null,  "can_upgrade_to": "news_plus"}
```

**Вот полная, профессиональная и расширенная OpenAPI/Swagger спецификация** для Backend API InvestCoach Russia в формате **YAML**.  
  
---  
  
**INVESTCOACH RUSSIA — OPENAPI SPECIFICATION**  
**Version 1.0**  
**Дата:** 18 сентября 2026  

```
openapi: 3.1.0
info:
  title: InvestCoach Russia API
  description: |
    Backend API для мобильного приложения InvestCoach Russia.
    Поддерживает двойную петлю вовлечения (Push + Pull), голосовой режим,
    multi-agent LLM систему на базе Claude 4 и LangGraph.
  version: "1.0.0"
  contact:
    name: InvestCoach Tech Team
    email: tech@investcoach.ru

servers:
  - url: https://api.investcoach.ru/v1
    description: Production Server
  - url: https://dev-api.investcoach.ru/v1
    description: Development Server

security:
  - FirebaseAuth: []

components:
  securitySchemes:
    FirebaseAuth:
      type: http
      scheme: bearer
      bearerFormat: JWT
      description: Firebase ID Token

  schemas:
    ErrorResponse:
      type: object
      properties:
        success:
          type: boolean
          example: false
        error:
          type: string
          example: "Validation error"
        message:
          type: string
          example: "Invalid request parameters"
        code:
          type: integer
          example: 400

    User:
      type: object
      properties:
        id:
          type: string
          example: "usr_9x4k2m8p"
        name:
          type: string
          example: "Алексей"
        tier:
          type: string
          enum: [free, news_plus, pro]
          example: "free"
        created_at:
          type: string
          format: date-time

    ChatRequest:
      type: object
      required: [message]
      properties:
        message:
          type: string
          example: "Что думаешь по сегодняшнему росту Сбера?"
        context_type:
          type: string
          enum: [general, news, portfolio, lesson]
          default: "general"
        news_id:
          type: string
        voice_session_id:
          type: string
        stream:
          type: boolean
          default: true

    VoiceRequest:
      type: object
      required: [audio_base64]
      properties:
        audio_base64:
          type: string
          description: Base64 encoded audio data
        voice_session_id:
          type: string
        context_type:
          type: string
          default: "general"

    TradeRequest:
      type: object
      required: [ticker, operation, shares]
      properties:
        ticker:
          type: string
          example: "SBER"
        operation:
          type: string
          enum: [buy, sell]
        shares:
          type: integer
          example: 500
        price:
          type: number
          format: float
          example: 287.45

    SubscriptionStatus:
      type: object
      properties:
        tier:
          type: string
          enum: [free, news_plus, pro]
        pull_requests_left:
          type: integer
        pull_requests_limit:
          type: integer
        news_plus_active:
          type: boolean
        expires_at:
          type: string
          format: date-time

paths:

  # ====================== AUTH ======================
  /auth/firebase:
    post:
      summary: Авторизация через Firebase
      tags: [Auth]
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                id_token:
                  type: string
                device_info:
                  type: object
                  properties:
                    platform: { type: string }
                    version: { type: string }
                    model: { type: string }
      responses:
        '200':
          description: Успешная авторизация
          content:
            application/json:
              schema:
                type: object
                properties:
                  success: { type: boolean }
                  user: { $ref: '#/components/schemas/User' }
                  access_token: { type: string }
                  refresh_token: { type: string }

  # ====================== CHAT ======================
  /chat/completion:
    post:
      summary: Основной чат с Coach (текст)
      tags: [Coach]
      description: Используется на главном экране "Coach" при текстовом вводе
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/ChatRequest'
      responses:
        '200':
          description: Ответ Coach (streaming SSE)
          content:
            text/event-stream:
              schema:
                type: string

  /chat/voice:
    post:
      summary: Голосовой режим (Voice-First)
      tags: [Coach, Voice]
      description: Используется при нажатии большой кнопки микрофона на главном экране
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/VoiceRequest'
      responses:
        '200':
          description: Транскрипт + ответ Coach + аудио
          content:
            application/json:
              schema:
                type: object
                properties:
                  transcript: { type: string }
                  response_text: { type: string }
                  audio_url: { type: string }
                  suggested_replies: 
                    type: array
                    items: { type: string }
                  bias_detected:
                    type: array
                    items: { type: string }

  # ====================== NEWS ======================
  /news/daily:
    get:
      summary: Получить персонализированные новости дня
      tags: [News]
      description: Используется на главном экране (Push карточка) и в экране "Новости"
      responses:
        '200':
          description: Список новостей
          content:
            application/json:
              schema:
                type: object
                properties:
                  news:
                    type: array
                    items:
                      type: object
                      properties:
                        id: { type: string }
                        title: { type: string }
                        summary: { type: string }
                        impact_on_portfolio: { type: boolean }
                        portfolio_impact_percent: { type: number }
                        published_at: { type: string, format: date-time }
                        tags: { type: array, items: { type: string } }

  /news/discuss/{news_id}:
    post:
      summary: Начать обсуждение конкретной новости
      tags: [News]
      description: Вызывается при нажатии "Обсудить" в экране Новости или по Push-уведомлению
      parameters:
        - name: news_id
          in: path
          required: true
          schema:
            type: string
      requestBody:
        content:
          application/json:
            schema:
              type: object
              properties:
                level:
                  type: string
                  enum: [brief, deep, simulation, trade_idea]
                  default: "deep"
                focus_areas:
                  type: array
                  items:
                    type: string
                    enum: [portfolio_impact, bias_analysis, scenario_planning]
      responses:
        '200':
          description: Streaming ответ Coach
          content:
            text/event-stream:
              schema:
                type: string

  # ====================== PORTFOLIO ======================
  /portfolio:
    get:
      summary: Получить состояние учебного портфеля
      tags: [Portfolio]
      description: Используется в экране "Портфель" и плавающей карточке на главном экране
      responses:
        '200':
          description: Состояние портфеля
          content:
            application/json:
              schema:
                type: object
                properties:
                  total_value: { type: number }
                  total_value_rub: { type: number }
                  daily_change_percent: { type: number }
                  allocation: { type: object }
                  positions:
                    type: array
                    items:
                      type: object
                      properties:
                        ticker: { type: string }
                        name: { type: string }
                        shares: { type: integer }
                        avg_price: { type: number }
                        current_price: { type: number }
                        pnl_percent: { type: number }
                        weight: { type: number }
                        coach_note: { type: string }

  /portfolio/trade:
    post:
      summary: Совершить сделку в учебном портфеле
      tags: [Portfolio]
      description: Вызывается при нажатии "Новая сделка" в экране Портфель
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/TradeRequest'
      responses:
        '200':
          description: Результат сделки + Instant Feedback от Coach
          content:
            application/json:
              schema:
                type: object
                properties:
                  success: { type: boolean }
                  trade_id: { type: string }
                  coach_feedback:
                    type: object
                    properties:
                      message: { type: string }
                      suggested_replies:
                        type: array
                        items: { type: string }

  # ====================== LEARNING ======================
  /weekly-review/current:
    get:
      summary: Получить текущий Weekly Review
      tags: [Learning]
      description: Используется в экране "Обучение" → Weekly Reviews
      responses:
        '200':
          description: Weekly Review
          content:
            application/json:
              schema:
                type: object
                properties:
                  week: { type: string }
                  process_score: { type: number }
                  insights: { type: array, items: { type: string } }
                  portfolio_comparison: { type: object }

  /lessons/recommended:
    get:
      summary: Рекомендованные микро-уроки
      tags: [Learning]
      description: Используется во вкладке "Сегодня" экрана Обучение
      responses:
        '200':
          description: Список уроков
          content:
            application/json:
              schema:
                type: object
                properties:
                  lessons:
                    type: array
                    items:
                      type: object
                      properties:
                        id: { type: string }
                        title: { type: string }
                        duration_seconds: { type: integer }
                        difficulty: { type: string }

  # ====================== SUBSCRIPTION ======================
  /subscription/status:
    get:
      summary: Статус подписки и лимиты
      tags: [Subscription]
      description: Используется в экране Профиль и при превышении лимита запросов
      responses:
        '200':
          description: Статус подписки
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/SubscriptionStatus'

  /subscription/upgrade:
    post:
      summary: Инициировать покупку подписки
      tags: [Subscription]
      description: Вызывается при нажатии кнопки апгрейда в профиле
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                plan:
                  type: string
                  enum: [news_plus, pro]
      responses:
        '200':
          description: Данные для покупки через RevenueCat
          content:
            application/json:
              schema:
                type: object
                properties:
                  success: { type: boolean }
                  rc_product_id: { type: string }
                  rc_offer_id: { type: string }

  # ====================== FEEDBACK ======================
  /feedback:
    post:
      summary: Отправка обратной связи о качестве ответа
      tags: [Feedback]
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                message_id:
                  type: string
                rating:
                  type: integer
                  minimum: 1
                  maximum: 5
                comment:
                  type: string
      responses:
        '200':
          description: Feedback accepted
          content:
            application/json:
              schema:
                type: object
                properties:
                  success: { type: boolean }

tags:
  - name: Auth
  - name: Coach
  - name: News
  - name: Portfolio
  - name: Learning
  - name: Subscription
  - name: Feedback``

```

**WEBSOCKET SPECIFICATION**  
**InvestCoach Russia — Real-time Chat & Streaming**  
Версия 1.0 | 18 сентября 2026  
  
---  
  
### 1. Общая информация  
  
- **Протокол:** WebSocket + JSON  
- **URL:** `wss://api.investcoach.ru/v1/ws/chat`  
- **Авторизация:** Firebase ID Token передаётся в query параметре при подключении  
- **Основное назначение:**  
- Streaming ответов от LLM (особенно важно для голосового режима)  
- Реал-тайм обновления состояния чата  
- Push-сообщения от Coach (например, Daily Insight)  
- Синхронизация состояния между устройствами  
  
**Пример URL подключения:**  

```
wss://api.investcoach.ru/v1/ws/chat?token=eyJhbGciOiJSUzI1NiIs...
```

  
  
---  
  
### 2. Формат сообщений  
  
Все сообщения имеют единую оболочку:  
  
{
  "type": "message_type",
  "payload": { ... },
  "timestamp": "2026-09-18T10:23:45.123Z",
  "message_id": "msg_7k9p2m8x"
}


---

### 3. Client → Server (Клиентские события)

#### 1. auth
{
  "type": "auth",
  "payload": {
    "token": "eyJhbGciOiJSUzI1NiIs..."
  }
}


#### 2. send_message — Отправка обычного текстового сообщения
{
  "type": "send_message",
  "payload": {
    "content": "Что думаешь по сегодняшнему отчёту Селигдара?",
    "context_type": "news",
    "news_id": "news_7843",
    "parent_message_id": null
  }
}


#### 3. start_voice_session — Начало голосового режима
{
  "type": "start_voice_session",
  "payload": {
    "context_type": "general"
  }
}


#### 4. send_voice_chunk — Отправка аудио чанков (для длинных сообщений)
{
  "type": "send_voice_chunk",
  "payload": {
    "voice_session_id": "vs_9k3m7p2x",
    "audio_base64_chunk": "base64data...",
    "sequence": 1,
    "is_final": true
  }
}


#### 5. ping
{
  "type": "ping"
}


---

### 4. Server → Client (События от сервера)

#### 1. auth_success / auth_error
{
  "type": "auth_success",
  "payload": {
    "user_id": "usr_9x4k2m8p",
    "session_id": "sess_8f3k9p2m"
  }
}


#### 2. message_received — Подтверждение получения сообщения
{
  "type": "message_received",
  "payload": {
    "message_id": "msg_7k9p2m8x",
    "status": "received"
  }
}


#### 3. coach_thinking — Coach начал думать
{
  "type": "coach_thinking",
  "payload": {
    "message_id": "msg_7k9p2m8x"
  }
}


#### 4. stream_chunk — Streaming ответа (самое важное событие)
{
  "type": "stream_chunk",
  "payload": {
    "message_id": "msg_7k9p2m8x",
    "content": "Сегодня Селигдар отчитался об увеличении производства золота на 9%.",
    "is_final": false
  }
}


Финальный чанк:
{
  "type": "stream_chunk",
  "payload": {
    "message_id": "msg_7k9p2m8x",
    "content": "Как ты думаешь, какие сигналы в этом отчёте были для тебя наиболее важными?",
    "is_final": true,
    "suggested_replies": [
      "Разобрать влияние на портфель",
      "Какие bias здесь могут проявляться?",
      "Сохранить в кейсы"
    ],
    "metadata": {
      "bias_detected": ["recency_bias"],
      "related_to_portfolio": true
    }
  }
}


#### 5. voice_response
{
  "type": "voice_response",
  "payload": {
    "voice_session_id": "vs_9k3m7p2x",
    "transcript": "Какие сегодня новости по Селигдару?",
    "response_text": "...",
    "audio_url": "https://cdn.investcoach.ru/voice/resp_9k2m3p7x.mp3",
    "duration_ms": 12400
  }
}


#### 6. push_notification
{
  "type": "push_notification",
  "payload": {
    "notification_id": "notif_4k8p2m",
    "title": "Важная новость по твоему портфелю",
    "body": "Сбер опубликовал сильный отчёт. Хочешь обсудить?",
    "data": {
      "type": "news",
      "news_id": "news_7843"
    }
  }
}


#### 7. error
{
  "type": "error",
  "payload": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Вы исчерпали лимит вопросов на сегодня. Перейдите на News+ за 149 ₽.",
    "suggest_upgrade": true
  }
}


---

### 5. Состояния WebSocket соединения

| Состояние | Описание |
|-------------------------|--------|
| connecting | Подключение |
| authenticated | Успешная авторизация |
| active | Нормальная работа |
| reconnecting | Автоматическое переподключение |
| closed | Соединение закрыто |

---

### 6. Рекомендации по реализации на Flutter

- Использовать пакет web_socket_channel
- Реализовать автоматическое переподключение с exponential backoff
- Хранить voice_session_id в памяти во время голосового режима
- При получении stream_chunk с is_final: true — завершать анимацию "Coach думает"
- При получении push_notification — показывать нативное push-уведомление + deep link

**Спецификация ошибок (Error Specification)** для Backend API и WebSocket InvestCoach Russia.  
  
---  
  
**ERROR SPECIFICATION**  
**InvestCoach Russia Backend & WebSocket**  
Версия 1.0 | 18 сентября 2026  
  
---  
  
### 1. Общий формат ошибок  
  
**Для REST API (HTTP):**  
  {
  "success": false,
  "error": "RATE_LIMIT_EXCEEDED",
  "message": "Вы исчерпали лимит вопросов на сегодня (8 из 8).",
  "code": 429,
  "details": {
    "limit": 8,
    "reset_in_seconds": 17400,
    "suggest_upgrade": true,
    "upgrade_plan": "news_plus"
  }
}
  
**Для WebSocket:**  
{
  "details": {
    "limit": 8,
    "used": 8,
    "reset_at": "2026-09-19T00:00:00Z",
    "reset_in_seconds": 17400,
    "suggest_upgrade": true,
    "upgrade_plan": "news_plus",
    "upgrade_price": 149,
    "reason": "daily_pull_limit"
  }
}
### 2. Полная спецификация Error Codes  
  
#### **2.1 Authentication & Authorization (4xx)**  
  
| Code | HTTP | Error Code | Сообщение | Где используется | Suggest Upgrade |  
|------|------|------------|---------|------------------|-----------------|  
| 401 | 401 | `UNAUTHORIZED` | Требуется авторизация | Все защищённые эндпоинты | false |  
| 403 | 403 | `FORBIDDEN` | Нет доступа к ресурсу | При попытке доступа к чужому портфелю | false |  
| 403 | 403 | `SUBSCRIPTION_REQUIRED` | Требуется подписка News+ | При исчерпании лимита на News+ фичах | true |  
| 498 | 498 | `TOKEN_EXPIRED` | Токен Firebase устарел | При любом запросе | false |  
  
#### **2.2 Rate Limiting & Quotas**  
  
| Code | HTTP | Error Code | Сообщение | Где используется |  
|------|------|------------|---------|------------------|  
| 429 | 429 | `RATE_LIMIT_EXCEEDED` | Вы исчерпали лимит вопросов на сегодня (8 из 8) | `/chat/completion`, `/chat/voice`, `/news/discuss` |  
| 429 | 429 | `DAILY_LIMIT_REACHED` | Достигнут дневной лимит взаимодействий | Все чат-эндпоинты |  
| 429 | 429 | `VOICE_LIMIT_REACHED` | Лимит голосового режима исчерпан (15 мин) | `/chat/voice` |  
  
#### **2.3 Validation & Bad Request**  
  
| Code | HTTP | Error Code | Сообщение | Пример |  
|------|------|------------|---------|-------|  
| 400 | 400 | `VALIDATION_ERROR` | Некорректные параметры запроса | Отсутствует `message` в `/chat/completion` |  
| 400 | 400 | `INVALID_TICKER` | Некорректный тикер | `ticker: "SBERR"` |  
| 400 | 400 | `INVALID_OPERATION` | Некорректная операция сделки | `operation: "hold"` |  
| 400 | 400 | `AUDIO_TOO_LARGE` | Аудио файл слишком большой | Voice mode |  
  
#### **2.4 Resource Not Found**  
  
| Code | HTTP | Error Code | Сообщение |  
|------|------|------------|---------|  
| 404 | 404 | `USER_NOT_FOUND` | Пользователь не найден |  
| 404 | 404 | `NEWS_NOT_FOUND` | Новость не найдена |  
| 404 | 404 | `TRADE_NOT_FOUND` | Сделка не найдена |  
| 404 | 404 | `REVIEW_NOT_FOUND` | Weekly Review не найден |  
  
#### **2.5 Server & AI Errors**  
  
| Code | HTTP | Error Code | Сообщение | Внутренний код |  
|------|------|------------|---------|--------------|  
| 500 | 500 | `INTERNAL_ERROR` | Внутренняя ошибка сервера | - |  
| 503 | 503 | `LLM_UNAVAILABLE` | Сервис LLM временно недоступен | Claude timeout |  
| 504 | 504 | `LLM_TIMEOUT` | Превышено время ожидания ответа от LLM | > 12 сек |  
| 529 | 529 | `AGENT_ERROR` | Ошибка в одном из LangGraph агентов | Bias Detective, News Agent и т.д. |  
| 530 | 530 | `MEMORY_ERROR` | Ошибка работы с долгосрочной памятью | Qdrant / Neo4j |  
  
#### **2.6 Business Logic Errors**  
  
| Code | HTTP | Error Code | Сообщение |  
|------|------|------------|---------|  
| 460 | 460 | `PORTFOLIO_LIMIT_EXCEEDED` | Превышено максимальное количество позиций в учебном портфеле (25) |  
| 461 | 461 | `INSUFFICIENT_FUNDS` | Недостаточно виртуальных средств для покупки |  
| 462 | 462 | `COACH_STYLE_NOT_SUPPORTED` | Выбранный стиль общения Coach не поддерживается |  
  
---  
  
### 3. Стандартные детали ошибки (`details`)  
  
{
  "details": {
    "limit": 8,
    "used": 8,
    "reset_at": "2026-09-19T00:00:00Z",
    "reset_in_seconds": 17400,
    "suggest_upgrade": true,
    "upgrade_plan": "news_plus",
    "upgrade_price": 149,
    "reason": "daily_pull_limit"
  }
}  
  
---  
  
### 4. Рекомендации по обработке ошибок в Flutter  
  
**Рекомендуемая стратегия:**  
  
1. **RATE_LIMIT_EXCEEDED (429)** → Показывать красивый paywall с предложением News+ за 149 ₽  
2. **LLM_TIMEOUT / LLM_UNAVAILABLE** → Показывать сообщение «Coach временно задумался. Попробуйте через минуту» + кнопка «Повторить»  
3. **TOKEN_EXPIRED (498)** → Автоматический silent refresh Firebase token  
4. **SUBSCRIPTION_REQUIRED (403)** → Мягкий paywall с объяснением преимуществ News+  
  
**Централизованный Error Handler** должен:  
- Логировать все ошибки в Sentry  
- Отправлять событие `error_occurred` в PostHog  
- Показывать пользователю понятное сообщение (без технического жаргона)  
  
---  
  
### 5. Полный список всех Error Codes (итоговая таблица)  
  
| HTTP | Error Code            | Описание            | Пользовательское сообщение                              |     |
| ---- | --------------------- | ------------------- | ------------------------------------------------------- | --- |
| 400  | VALIDATION_ERROR      | Некорректные данные | "Проверьте введённые данные"                            |     |
| 401  | UNAUTHORIZED          | Не авторизован      | "Пожалуйста, войдите в аккаунт"                         |     |
| 403  | FORBIDDEN             | Нет доступа         | "У вас нет доступа к этому действию"                    |     |
| 403  | SUBSCRIPTION_REQUIRED | Требуется подписка  | "Эта функция доступна только по подписке News+"         |     |
| 429  | RATE_LIMIT_EXCEEDED   | Лимит исчерпан      | "Вы исчерпали лимит вопросов на сегодня"                |     |
| 498  | TOKEN_EXPIRED         | Токен истёк         | "Сессия устарела. Обновляем..."                         |     |
| 500  | INTERNAL_ERROR        | Внутренняя ошибка   | "Что-то пошло не так. Попробуйте позже"                 |     |
| 503  | LLM_UNAVAILABLE       | LLM недоступен      | "Coach сейчас очень задумался. Попробуйте через минуту" |     |
| 504  | LLM_TIMEOUT           | Таймаут LLM         | "Ответ занимает слишком много времени"                  |     |

**Вот обновлённая и полная OpenAPI/Swagger спецификация** (YAML) для InvestCoach Russia с включением всех error codes, детальными описаниями, примерами и компонентами + с добавленной **WebSocket частью** в секцию `paths` с использованием расширения `x-websocket`

**INVESTCOACH RUSSIA — FULL OPENAPI + WEBSOCKET SPECIFICATION**  
**Version 1.1** | 18 сентября 2026

```
openapi: 3.1.0
info:
  title: InvestCoach Russia API
  description: |
    Backend API для мобильного приложения InvestCoach Russia.
    Включает REST API и WebSocket для real-time чата, streaming ответов LLM 
    и push-уведомлений от Coach.
    Основной акцент — высокая ежедневная вовлечённость (36–40 взаимодействий на DAU).
  version: "1.1.0"
  contact:
    name: InvestCoach Tech Team
    email: tech@investcoach.ru

servers:
  - url: https://api.investcoach.ru/v1
    description: Production server
  - url: https://dev-api.investcoach.ru/v1
    description: Development server

security:
  - FirebaseAuth: []

components:
  securitySchemes:
    FirebaseAuth:
      type: http
      scheme: bearer
      bearerFormat: JWT
      description: Firebase ID Token

  schemas:
    ErrorResponse:
      type: object
      required: [success, error, message, code]
      properties:
        success:
          type: boolean
          example: false
        error:
          type: string
          example: RATE_LIMIT_EXCEEDED
        message:
          type: string
          example: "Вы исчерпали лимит вопросов на сегодня"
        code:
          type: integer
          example: 429
        details:
          type: object
          additionalProperties: true

    User:
      type: object
      properties:
        id: { type: string, example: "usr_9x4k2m8p" }
        name: { type: string, example: "Алексей" }
        tier: 
          type: string
          enum: [free, news_plus, pro]
        created_at: 
          type: string
          format: date-time

    ChatRequest:
      type: object
      required: [message]
      properties:
        message: { type: string, example: "Что думаешь по сегодняшнему росту Сбера?" }
        context_type:
          type: string
          enum: [general, news, portfolio, lesson]
          default: "general"
        news_id: { type: string }
        voice_session_id: { type: string }
        stream: 
          type: boolean
          default: true

    VoiceRequest:
      type: object
      required: [audio_base64]
      properties:
        audio_base64: 
          type: string
          description: Base64 encoded audio data
        voice_session_id: { type: string }
        context_type: 
          type: string
          default: "general"

    TradeRequest:
      type: object
      required: [ticker, operation, shares]
      properties:
        ticker: { type: string, example: "SBER" }
        operation: 
          type: string
          enum: [buy, sell]
        shares: 
          type: integer
          example: 500
        price: 
          type: number
          format: float
          example: 287.45

    SubscriptionStatus:
      type: object
      properties:
        tier: 
          type: string
          enum: [free, news_plus, pro]
        pull_requests_left: { type: integer, example: 3 }
        pull_requests_limit: { type: integer, example: 8 }
        news_plus_active: { type: boolean }
        expires_at: 
          type: string
          format: date-time
          nullable: true

  responses:
    BadRequest:
      description: Bad Request
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/ErrorResponse'
    RateLimitExceeded:
      description: Rate limit exceeded
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/ErrorResponse'
          example:
            success: false
            error: RATE_LIMIT_EXCEEDED
            message: "Вы исчерпали лимит вопросов на сегодня (8 из 8)"
            code: 429
            details:
              limit: 8
              used: 8
              reset_in_seconds: 17400
              suggest_upgrade: true
              upgrade_plan: "news_plus"

paths:

  # ====================== AUTH ======================
  /auth/firebase:
    post:
      summary: Авторизация через Firebase ID Token
      tags: [Auth]
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                id_token: { type: string }
                device_info:
                  type: object
                  properties:
                    platform: { type: string }
                    version: { type: string }
                    model: { type: string }
      responses:
        '200':
          description: Successful authentication
          content:
            application/json:
              schema:
                type: object
                properties:
                  success: { type: boolean }
                  user: { $ref: '#/components/schemas/User' }
                  access_token: { type: string }
                  refresh_token: { type: string }
        '400': { $ref: '#/components/responses/BadRequest' }
        '401': { $ref: '#/components/responses/Unauthorized' }

  # ====================== CHAT (REST) ======================
  /chat/completion:
    post:
      summary: Основной чат с Coach (текстовый)
      tags: [Coach]
      description: Используется на главном экране Coach при текстовом вводе
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/ChatRequest'
      responses:
        '200':
          description: Streaming response via SSE
          content:
            text/event-stream:
              schema:
                type: string
        '429': { $ref: '#/components/responses/RateLimitExceeded' }

  /chat/voice:
    post:
      summary: Голосовой режим (Voice-First)
      tags: [Coach, Voice]
      description: Вызывается при нажатии большой кнопки микрофона на главном экране
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/VoiceRequest'
      responses:
        '200':
          description: Voice response with audio URL
          content:
            application/json:
              schema:
                type: object
                properties:
                  transcript: { type: string }
                  response_text: { type: string }
                  audio_url: { type: string }
                  suggested_replies: 
                    type: array
                    items: { type: string }
                  bias_detected: 
                    type: array
                    items: { type: string }

  # ====================== NEWS ======================
  /news/daily:
    get:
      summary: Персонализированные новости дня (Push)
      tags: [News]
      description: Используется на главном экране и для push-уведомлений
      responses:
        '200':
          description: List of personalized news
          content:
            application/json:
              schema:
                type: object
                properties:
                  news:
                    type: array
                    items:
                      type: object
                      properties:
                        id: { type: string }
                        title: { type: string }
                        summary: { type: string }
                        impact_on_portfolio: { type: boolean }
                        portfolio_impact_percent: { type: number }
                        published_at: { type: string, format: date-time }
                        tags: 
                          type: array
                          items: { type: string }

  /news/discuss/{news_id}:
    post:
      summary: Начать обсуждение конкретной новости
      tags: [News]
      parameters:
        - name: news_id
          in: path
          required: true
          schema: { type: string }
      requestBody:
        content:
          application/json:
            schema:
              type: object
              properties:
                level:
                  type: string
                  enum: [brief, deep, simulation, trade_idea]
                  default: deep
      responses:
        '200':
          description: Streaming Coach response
          content:
            text/event-stream:
              schema:
                type: string

  # ====================== PORTFOLIO ======================
  /portfolio:
    get:
      summary: Получить состояние учебного портфеля
      tags: [Portfolio]
      responses:
        '200':
          description: Portfolio state
          content:
            application/json:
              schema:
                type: object
                properties:
                  total_value: { type: number }
                  total_value_rub: { type: number }
                  daily_change_percent: { type: number }
                  allocation: { type: object }
                  positions: { type: array, items: { type: object } }

  /portfolio/trade:
    post:
      summary: Совершить сделку в учебном портфеле
      tags: [Portfolio]
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/TradeRequest'
      responses:
        '200':
          description: Trade executed + Coach feedback
          content:
            application/json:
              schema:
                type: object
                properties:
                  success: { type: boolean }
                  trade_id: { type: string }
                  coach_feedback: { type: object }

  # ====================== LEARNING ======================
  /weekly-review/current:
    get:
      summary: Получить текущий Weekly Review
      tags: [Learning]
      responses:
        '200':
          description: Weekly Review
          content:
            application/json:
              schema:
                type: object
                properties:
                  week: { type: string }
                  process_score: { type: number, format: float }
                  insights: 
                    type: array
                    items: { type: string }

  # ====================== SUBSCRIPTION ======================
  /subscription/status:
    get:
      summary: Статус подписки и лимиты
      tags: [Subscription]
      responses:
        '200':
          description: Subscription status
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/SubscriptionStatus'

  /subscription/upgrade:
    post:
      summary: Инициировать покупку подписки
      tags: [Subscription]
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                plan:
                  type: string
                  enum: [news_plus, pro]
      responses:
        '200':
          description: RevenueCat purchase data
          content:
            application/json:
              schema:
                type: object
                properties:
                  success: { type: boolean }
                  rc_product_id: { type: string }
                  rc_offer_id: { type: string }

  # ====================== WEBSOCKET (Chat & Streaming) ======================
  /ws/chat:
    x-websocket:
      summary: WebSocket endpoint для real-time чата и streaming
      description: |
        WebSocket соединение для streaming ответов Coach, голосового режима,
        push-уведомлений и синхронизации состояния.
        Подключение: wss://api.investcoach.ru/v1/ws/chat?token=
      tags: [WebSocket, Coach]
      connect:
        summary: Подключение к WebSocket
        parameters:
          - name: token
            in: query
            required: true
            schema:
              type: string
            description: Firebase ID Token
        responses:
          '101':
            description: Switching Protocols - WebSocket connection established
      messages:
        incoming:
          - $ref: '#/components/messages/ClientMessage'
        outgoing:
          - $ref: '#/components/messages/ServerMessage'

components:
  messages:
    ClientMessage:
      type: object
      properties:
        type:
          type: string
          enum: 
            - auth
            - send_message
            - start_voice_session
            - send_voice_chunk
            - ping
        payload:
          type: object
          additionalProperties: true

    ServerMessage:
      type: object
      properties:
        type:
          type: string
          enum:
            - auth_success
            - auth_error
            - message_received
            - coach_thinking
            - stream_chunk
            - voice_response
            - push_notification
            - error
        payload:
          type: object
          additionalProperties: true
        timestamp:
          type: string
          format: date-time
        message_id:
          type: string

tags:
  - name: Auth
  - name: Coach
  - name: News
  - name: Portfolio
  - name: Learning
  - name: Subscription
  - name: Feedback
  - name: WebSocket
```


Я добавил новую секцию `x-websocket-examples` с подробными примерами полного цикла общения:
- Добавлена полноценная секция `x-websocket` в путь `/ws/chat`  
- Добавлены **реалистичные примеры полного цикла разговора** (`FullConversationCycle`)  
- Примеры включают:  
- Авторизацию  
- Обычный текстовый запрос  
- Streaming ответа  
- Переход в голосовой режим  
- Отправку голосового чанка  
- Получение голосового ответа  
- Push-уведомление от Coach  
- Пример ошибки

```
openapi: 3.1.0
info:
  title: InvestCoach Russia API
  description: |
    Backend API для мобильного приложения InvestCoach Russia.
    Включает REST API и WebSocket для real-time чата, streaming ответов LLM,
    голосового режима и push-уведомлений от Coach.
  version: "1.2.0"
  contact:
    name: InvestCoach Tech Team
    email: tech@investcoach.ru

servers:
  - url: https://api.investcoach.ru/v1
    description: Production server

security:
  - FirebaseAuth: []

components:
  securitySchemes:
    FirebaseAuth:
      type: http
      scheme: bearer
      bearerFormat: JWT

  schemas:
    ErrorResponse:
      type: object
      required: [success, error, message, code]
      properties:
        success: { type: boolean, example: false }
        error: { type: string, example: RATE_LIMIT_EXCEEDED }
        message: { type: string, example: "Вы исчерпали лимит вопросов на сегодня" }
        code: { type: integer, example: 429 }
        details: { type: object, additionalProperties: true }

  messages:
    ClientMessage:
      type: object
      properties:
        type:
          type: string
          enum: [auth, send_message, start_voice_session, send_voice_chunk, ping]
        payload:
          type: object
          additionalProperties: true
        timestamp:
          type: string
          format: date-time

    ServerMessage:
      type: object
      properties:
        type:
          type: string
          enum:
            - auth_success
            - auth_error
            - message_received
            - coach_thinking
            - stream_chunk
            - voice_response
            - push_notification
            - error
        payload:
          type: object
          additionalProperties: true
        timestamp:
          type: string
          format: date-time
        message_id:
          type: string

  x-websocket-examples:
    FullConversationCycle:
      summary: Полный цикл разговора (текстовый + голосовой)
      description: Реалистичный пример полного взаимодействия пользователя с Coach
      steps:
        - type: client
          action: auth
          description: "Пользователь подключается к WebSocket"
          payload:
            type: "auth"
            payload:
              token: "eyJhbGciOiJSUzI1NiIs..."

        - type: server
          action: auth_success
          description: "Сервер подтверждает авторизацию"
          payload:
            type: "auth_success"
            payload:
              user_id: "usr_9x4k2m8p"
              session_id: "sess_7f3k9p2m"
            timestamp: "2026-09-18T10:23:45.123Z"

        - type: client
          action: send_message
          description: "Пользователь спрашивает про новость"
          payload:
            type: "send_message"
            payload:
              content: "Какие сегодня новости по Селигдару?"
              context_type: "news"
              news_id: "news_7843"

        - type: server
          action: message_received
          payload:
            type: "message_received"
            payload:
              message_id: "msg_9k2m3p7x"
              status: "received"

        - type: server
          action: coach_thinking
          payload:
            type: "coach_thinking"
            payload:
              message_id: "msg_9k2m3p7x"

        - type: server
          action: stream_chunk (multiple)
          description: "Streaming ответа Coach"
          payload_examples:
            - type: "stream_chunk"
              payload:
                message_id: "msg_9k2m3p7x"
                content: "Сегодня Селигдар опубликовал сильные операционные результаты."
                is_final: false
            - type: "stream_chunk"
              payload:
                message_id: "msg_9k2m3p7x"
                content: "Давай вместе посмотрим, какие сигналы в этом отчёте важны именно для тебя?"
                is_final: true
                suggested_replies:
                  - "Как это влияет на мой портфель?"
                  - "Какие bias здесь могут проявляться?"
                  - "Сохранить этот разбор"

        - type: client
          action: start_voice_session
          description: "Пользователь переключается на голосовой режим"
          payload:
            type: "start_voice_session"
            payload:
              context_type: "news"
              news_id: "news_7843"

        - type: client
          action: send_voice_chunk
          description: "Пользователь говорит голосом"
          payload:
            type: "send_voice_chunk"
            payload:
              voice_session_id: "vs_8f3k9p2m"
              audio_base64_chunk: "...base64data..."
              sequence: 1
              is_final: true

        - type: server
          action: voice_response
          description: "Coach отвечает голосом"
          payload:
            type: "voice_response"
            payload:
              voice_session_id: "vs_8f3k9p2m"
              transcript: "Сегодня Селигдар отчитался об увеличении производства золота на 9%."
              response_text: "Сегодня Селигдар показал хорошие операционные результаты..."
              audio_url: "https://cdn.investcoach.ru/voice/resp_9k2m3p7x.mp3"
              suggested_replies:
                - "Как это влияет на мой портфель?"
                - "Давай разберём подробнее"

        - type: server
          action: push_notification
          description: "Coach присылает пуш с новой важной новостью"
          payload:
            type: "push_notification"
            payload:
              notification_id: "notif_4k8p2m"
              title: "Важное движение по твоему портфелю"
              body: "Полиметалл резко вырос после отчётности. Хочешь обсудить?"
              data:
                type: "news"
                news_id: "news_9124"

    ErrorExample:
      summary: Пример ошибки
      payload:
        type: "error"
        payload:
          code: "RATE_LIMIT_EXCEEDED"
          message: "Вы исчерпали лимит вопросов на сегодня (8 из 8)"
          details:
            limit: 8
            used: 8
            reset_in_seconds: 17400
            suggest_upgrade: true
            upgrade_plan: "news_plus"

paths:
  /ws/chat:
    x-websocket:
      summary: WebSocket для real-time чата, streaming и голосового режима
      description: |
        Основной WebSocket endpoint.
        Подключение: wss://api.investcoach.ru/v1/ws/chat?token=
        
        Поддерживает:
        - Streaming ответов Coach
        - Голосовой режим (Voice-First)
        - Push-уведомления от Coach
        - Реал-тайм обновление состояния
      tags: [WebSocket, Coach]
      connect:
        summary: Установить WebSocket соединение
        parameters:
          - name: token
            in: query
            required: true
            schema:
              type: string
            description: Firebase ID Token
        responses:
          '101':
            description: WebSocket connection established
      messages:
        incoming:
          - $ref: '#/components/messages/ClientMessage'
        outgoing:
          - $ref: '#/components/messages/ServerMessage'
      x-websocket-examples:
        full_conversation_cycle:
          $ref: '#/components/x-websocket-examples/FullConversationCycle'
        error_example:
          $ref: '#/components/x-websocket-examples/ErrorExample'

  # REST Endpoints (сокращённо для экономии места, но полностью актуальны)
  /auth/firebase:
    post:
      summary: Авторизация через Firebase
      tags: [Auth]
      # ... (остальные REST endpoints остаются как в предыдущей версии)

tags:
  - name: Auth
  - name: Coach
  - name: News
  - name: Portfolio
  - name: Learning
  - name: Subscription
  - name: Feedback
  - name: WebSocket