// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'InvestCoach';

  @override
  String get tabCoach => 'Коуч';

  @override
  String get tabNews => 'Новости';

  @override
  String get tabPortfolio => 'Портфель';

  @override
  String get tabLearning => 'Обучение';

  @override
  String get tabProfile => 'Профиль';

  @override
  String get coachOnline => 'Онлайн';

  @override
  String get coachOffline => 'Офлайн';

  @override
  String get onboardingTitle => 'Онбординг';

  @override
  String get featureInDevelopment => 'В разработке';

  @override
  String featureInDevelopmentDesc(String feature, String sprint) {
    return 'Экран «$feature» появится в $sprint.';
  }

  @override
  String get sprint1to2 => 'спринтах 1–2';

  @override
  String get sprint3 => 'спринте 3';

  @override
  String get sprint4 => 'спринте 4';

  @override
  String get onbWelcomeTitle => 'Познакомься со своим Coach';

  @override
  String get onbWelcomeText =>
      'Каждый день мы вместе разбираем новости российского рынка и учимся принимать спокойные, взвешенные решения. Это займёт меньше минуты.';

  @override
  String get onbWelcomeStart => 'Давай начнём';

  @override
  String onbStep(int step, int total) {
    return 'Шаг $step из $total';
  }

  @override
  String get onbNameTitle => 'Как тебя зовут?';

  @override
  String get onbNameSubtitle => 'Coach будет обращаться к тебе по имени';

  @override
  String get onbNameHint => 'Твоё имя';

  @override
  String get onbNameError => 'Введи имя — минимум 2 символа';

  @override
  String get onbContinue => 'Продолжить';

  @override
  String get onbBack => 'Назад';

  @override
  String get onbExperienceTitle => 'Твой опыт в инвестициях';

  @override
  String get onbExperienceSubtitle => 'Подстрою объяснения под твой уровень';

  @override
  String get onbExpBeginner => 'Я новичок';

  @override
  String get onbExpBeginnerDesc => 'Никогда не инвестировал';

  @override
  String get onbExpIntermediate => 'Понимаю основы';

  @override
  String get onbExpIntermediateDesc => 'Знаю, что такое акции и облигации';

  @override
  String get onbExpAdvanced => 'Опытный инвестор';

  @override
  String get onbExpAdvancedDesc => 'Инвестирую регулярно';

  @override
  String get onbGoalsTitle => 'Что тренируем?';

  @override
  String get onbGoalsSubtitle => 'Выбери от одной цели — можно несколько';

  @override
  String get onbGoalNews => 'Понимать новости рынка';

  @override
  String get onbGoalBias => 'Замечать свои ошибки';

  @override
  String get onbGoalPortfolio => 'Управлять портфелем';

  @override
  String get onbGoalSaving => 'Регулярно откладывать';

  @override
  String get onbGoalsError => 'Выбери хотя бы одну цель';

  @override
  String get onbRiskTitle => 'Насколько ты смелый?';

  @override
  String get onbRiskSubtitle => 'Так Coach подберёт уровень риска';

  @override
  String get onbRiskConservative => 'Осторожный';

  @override
  String get onbRiskConservativeDesc => 'Сохранность важнее доходности';

  @override
  String get onbRiskModerate => 'Умеренный';

  @override
  String get onbRiskModerateDesc => 'Баланс риска и доходности';

  @override
  String get onbRiskAggressive => 'Смелый';

  @override
  String get onbRiskAggressiveDesc => 'Готов к росту и волатильности';

  @override
  String get onbStyleTitle => 'Как Coach говорит с тобой?';

  @override
  String get onbStyleDetailed => 'Подробно, с примерами';

  @override
  String get onbStyleConcise => 'Кратко, по сути';

  @override
  String get onbCreateCoach => 'Создать Coach';

  @override
  String get onbCreatingTitle => 'Создаём твоего Coach…';

  @override
  String get onbCreatingText =>
      'Настраиваю тон общения и твой учебный портфель';

  @override
  String greetingMorning(String name) {
    return 'Доброе утро, $name!';
  }

  @override
  String greetingDay(String name) {
    return 'Добрый день, $name!';
  }

  @override
  String greetingEvening(String name) {
    return 'Добрый вечер, $name!';
  }

  @override
  String get greetingFallback => 'Привет!';

  @override
  String discussNewsQuestion(String title) {
    return 'Расскажи про новость «$title» и что она значит для моего портфеля';
  }

  @override
  String discussLessonQuestion(String title) {
    return 'Давай обсудим урок «$title» — помоги понять, как это применить';
  }

  @override
  String aboutNews(String title) {
    return 'О новости: $title';
  }

  @override
  String get allocStocks => 'Акции';

  @override
  String get allocBonds => 'Облигации';

  @override
  String get allocEtf => 'Фонды';

  @override
  String get allocOther => 'Прочее';

  @override
  String get portfolioPositions => 'Позиции';

  @override
  String get portfolioTrades => 'Последние сделки';

  @override
  String get portfolioEmpty =>
      'Портфель ещё не создан. Coach подготовит его после онбординга.';

  @override
  String get tradeBuy => 'Покупка';

  @override
  String get tradeSell => 'Продажа';

  @override
  String get todayImportant => 'Сегодня важно';

  @override
  String get quickActions => 'Быстрые вопросы';

  @override
  String get quickQ1 => 'Что сегодня на рынке?';

  @override
  String get quickQ2 => 'Как мой портфель?';

  @override
  String get quickQ3 => 'Что такое диверсификация?';

  @override
  String get quickQ4 => 'Объясни проще';

  @override
  String get chatInputHint => 'Спроси Coach что угодно…';

  @override
  String coachFirstMessage(String name) {
    return 'Привет, $name! Я — твой Coach. Я помогу разобраться с новостями и делать взвешенные решения. Давай начнём с главного?';
  }

  @override
  String get portfolioCardTitle => 'Твой портфель';

  @override
  String get retry => 'Повторить';

  @override
  String get somethingWentWrong => 'Что-то пошло не так';

  @override
  String get noNewsForToday => 'Сегодня новостей пока нет — загляни позже';

  @override
  String get newsFeedTitle => 'Новости дня';

  @override
  String get todayImportantDiscuss => 'Обсудить с Coach';

  @override
  String get newsImpactPortfolio => 'Влияет на твой портфель';

  @override
  String get newsNoImpact => 'На портфель не влияет';

  @override
  String get chatThinking => 'Coach думает…';

  @override
  String get paywallTitle => 'Вопросы на сегодня закончились';

  @override
  String get paywallText =>
      'Тариф Free — 8 вопросов в день. News+ за 149 ₽/мес — без ограничений.';

  @override
  String get paywallUpgrade => 'Перейти на News+';

  @override
  String get paywallLater => 'Позже';

  @override
  String get paywallStubHint =>
      'Оплату подписки подключим в следующем обновлении';

  @override
  String get voiceStart => 'Спроси голосом';

  @override
  String get voiceListening => 'Слушаю тебя…';

  @override
  String get voiceProcessing => 'Coach разбирает вопрос…';

  @override
  String get voiceSpeaking => 'Coach отвечает';

  @override
  String get voiceDone => 'Готово';

  @override
  String get voiceStop => 'Остановить';

  @override
  String get voiceMockHint =>
      'Голос подключим в следующем обновлении, а пока Coach «слышит» тебя в демо-режиме';

  @override
  String get voiceTapToStop => 'Тапни по микрофону, чтобы остановить';

  @override
  String get voiceMicUnavailable =>
      'Не удалось открыть микрофон. Проверь разрешения в настройках устройства';

  @override
  String get voiceAskAgain => 'Спросить ещё';

  @override
  String get voiceClose => 'Закрыть';

  @override
  String biasChip(String bias) {
    return 'Заметил: $bias';
  }

  @override
  String get learnTabToday => 'Сегодня';

  @override
  String get learnTabReviews => 'Weekly Reviews';

  @override
  String get learnTabCases => 'Мои Кейсы';

  @override
  String get learnTabProgress => 'Прогресс';

  @override
  String learnLessonDuration(int seconds) {
    return '$seconds сек';
  }

  @override
  String get learnLessonStart => 'Пройти';

  @override
  String get learnLessonDiscuss => 'Обсудить с Coach';

  @override
  String get learnLessonCompleted => 'Пройдено';

  @override
  String get learnLessonComplete => 'Завершить';

  @override
  String get learnNoLessons =>
      'Сегодня уроков нет — Coach подберёт новые завтра';

  @override
  String get learnReviewScore => 'Process Score';

  @override
  String get learnReviewInsights => 'Ключевые инсайты';

  @override
  String get learnReviewCompare => 'Сравнение с индексом';

  @override
  String get learnReviewYourReturn => 'Твой результат';

  @override
  String get learnReviewIndexReturn => 'Индекс';

  @override
  String get learnReviewDiscuss => 'Обсудить с Coach';

  @override
  String get learnReviewEmpty => 'Первый Weekly Review появится в конце недели';

  @override
  String get learnReviewHistory => 'История';

  @override
  String get learnCasesEmpty =>
      'Сохранённых кейсов пока нет. Обсуди новость с Coach и нажми «Сохранить»';

  @override
  String get learnCasesSearch => 'Поиск по кейсам…';

  @override
  String get learnProgressStreak => 'Стрик';

  @override
  String learnProgressStreakDays(int count) {
    return '$count дн.';
  }

  @override
  String get learnProgressAvg => 'Среднее в день';

  @override
  String learnProgressAvgValue(int count) {
    return '$count взаимодействий';
  }

  @override
  String get learnProgressTopics => 'Топ темы';

  @override
  String get learnProgressBias => 'Bias-паттерны';

  @override
  String get learnProgressEmpty => 'Данных пока мало — возвращайся каждый день';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get profileTierFree => 'Free';

  @override
  String get profileTierNewsPlus => 'News+';

  @override
  String get profileTierPro => 'Pro';

  @override
  String get profileStats30 => 'Статистика за 30 дней';

  @override
  String get profileStreak => 'Стрик';

  @override
  String profileStreakValue(int count) {
    return '$count дн. подряд';
  }

  @override
  String get profileAvgInteractions => 'Среднее в день';

  @override
  String profileAvgValue(int count) {
    return '$count взаимодействий';
  }

  @override
  String get profileTopTopics => 'Любимые темы';

  @override
  String get profileMyCoach => 'Мой Coach';

  @override
  String get profileStyleTitle => 'Стиль общения';

  @override
  String get profileStyleDetailed => 'Подробно, с примерами';

  @override
  String get profileStyleConcise => 'Кратко, по сути';

  @override
  String get profileStyleSaved => 'Стиль обновлён';

  @override
  String get profilePushTitle => 'Push-уведомления';

  @override
  String get profilePushDaily => 'Новость дня';

  @override
  String get profilePushReview => 'Weekly Review готов';

  @override
  String get profilePushLesson => 'Новый урок';

  @override
  String get profileUpgradeTitle => 'News+ за 149 ₽/мес';

  @override
  String get profileUpgradeText =>
      'Безлимитные вопросы, все уроки, детальные разборы';

  @override
  String get profileUpgradeButton => 'Перейти на News+';

  @override
  String get profileUpgradeFeatures => 'Что даёт News+';

  @override
  String get profileFeatureUnlimited => 'Безлимитные Pull-запросы';

  @override
  String get profileFeatureLessons => 'Все микро-уроки и разборы';

  @override
  String get profileFeaturePriority => 'Приоритетная очередь Coach';

  @override
  String get profileAbout => 'О приложении';

  @override
  String profileAboutVersion(String version) {
    return 'Версия $version';
  }

  @override
  String get profileAboutDisclaimer =>
      'InvestCoach — образовательное приложение. Не является индивидуальной инвестиционной рекомендацией.';

  @override
  String profilePullLeft(int left, int limit) {
    return 'Осталось вопросов: $left из $limit';
  }

  @override
  String get themeSelectTitle => 'Выберите тему';

  @override
  String get themeSelectSubtitle =>
      'Каждое утро начинается с настроения. Выберите свой.';

  @override
  String get themeSelectStart => 'Начать';

  @override
  String get profileThemeSection => 'Тема интерфейса';

  @override
  String get profileThemeHint => 'Можно поменять в любой момент';

  @override
  String get themeDark => 'Тёмная тема';

  @override
  String get themeLight => 'Светлая тема';

  @override
  String get offlineBanner =>
      'Вы оффлайн. Coach ответит, когда появится связь.';
}
