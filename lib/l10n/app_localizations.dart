import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In ru, this message translates to:
  /// **'InvestCoach'**
  String get appTitle;

  /// No description provided for @tabCoach.
  ///
  /// In ru, this message translates to:
  /// **'Коуч'**
  String get tabCoach;

  /// No description provided for @tabNews.
  ///
  /// In ru, this message translates to:
  /// **'Новости'**
  String get tabNews;

  /// No description provided for @tabPortfolio.
  ///
  /// In ru, this message translates to:
  /// **'Портфель'**
  String get tabPortfolio;

  /// No description provided for @tabLearning.
  ///
  /// In ru, this message translates to:
  /// **'Обучение'**
  String get tabLearning;

  /// No description provided for @tabProfile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get tabProfile;

  /// No description provided for @coachOnline.
  ///
  /// In ru, this message translates to:
  /// **'Онлайн'**
  String get coachOnline;

  /// No description provided for @coachOffline.
  ///
  /// In ru, this message translates to:
  /// **'Офлайн'**
  String get coachOffline;

  /// No description provided for @onboardingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Онбординг'**
  String get onboardingTitle;

  /// No description provided for @featureInDevelopment.
  ///
  /// In ru, this message translates to:
  /// **'В разработке'**
  String get featureInDevelopment;

  /// No description provided for @featureInDevelopmentDesc.
  ///
  /// In ru, this message translates to:
  /// **'Экран «{feature}» появится в {sprint}.'**
  String featureInDevelopmentDesc(String feature, String sprint);

  /// No description provided for @sprint1to2.
  ///
  /// In ru, this message translates to:
  /// **'спринтах 1–2'**
  String get sprint1to2;

  /// No description provided for @sprint3.
  ///
  /// In ru, this message translates to:
  /// **'спринте 3'**
  String get sprint3;

  /// No description provided for @sprint4.
  ///
  /// In ru, this message translates to:
  /// **'спринте 4'**
  String get sprint4;

  /// No description provided for @onbWelcomeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Познакомься со своим Coach'**
  String get onbWelcomeTitle;

  /// No description provided for @onbWelcomeText.
  ///
  /// In ru, this message translates to:
  /// **'Каждый день мы вместе разбираем новости российского рынка и учимся принимать спокойные, взвешенные решения. Это займёт меньше минуты.'**
  String get onbWelcomeText;

  /// No description provided for @onbWelcomeStart.
  ///
  /// In ru, this message translates to:
  /// **'Давай начнём'**
  String get onbWelcomeStart;

  /// No description provided for @onbStep.
  ///
  /// In ru, this message translates to:
  /// **'Шаг {step} из {total}'**
  String onbStep(int step, int total);

  /// No description provided for @onbNameTitle.
  ///
  /// In ru, this message translates to:
  /// **'Как тебя зовут?'**
  String get onbNameTitle;

  /// No description provided for @onbNameSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Coach будет обращаться к тебе по имени'**
  String get onbNameSubtitle;

  /// No description provided for @onbNameHint.
  ///
  /// In ru, this message translates to:
  /// **'Твоё имя'**
  String get onbNameHint;

  /// No description provided for @onbNameError.
  ///
  /// In ru, this message translates to:
  /// **'Введи имя — минимум 2 символа'**
  String get onbNameError;

  /// No description provided for @onbContinue.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get onbContinue;

  /// No description provided for @onbBack.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get onbBack;

  /// No description provided for @onbExperienceTitle.
  ///
  /// In ru, this message translates to:
  /// **'Твой опыт в инвестициях'**
  String get onbExperienceTitle;

  /// No description provided for @onbExperienceSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Подстрою объяснения под твой уровень'**
  String get onbExperienceSubtitle;

  /// No description provided for @onbExpBeginner.
  ///
  /// In ru, this message translates to:
  /// **'Я новичок'**
  String get onbExpBeginner;

  /// No description provided for @onbExpBeginnerDesc.
  ///
  /// In ru, this message translates to:
  /// **'Никогда не инвестировал'**
  String get onbExpBeginnerDesc;

  /// No description provided for @onbExpIntermediate.
  ///
  /// In ru, this message translates to:
  /// **'Понимаю основы'**
  String get onbExpIntermediate;

  /// No description provided for @onbExpIntermediateDesc.
  ///
  /// In ru, this message translates to:
  /// **'Знаю, что такое акции и облигации'**
  String get onbExpIntermediateDesc;

  /// No description provided for @onbExpAdvanced.
  ///
  /// In ru, this message translates to:
  /// **'Опытный инвестор'**
  String get onbExpAdvanced;

  /// No description provided for @onbExpAdvancedDesc.
  ///
  /// In ru, this message translates to:
  /// **'Инвестирую регулярно'**
  String get onbExpAdvancedDesc;

  /// No description provided for @onbGoalsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Что тренируем?'**
  String get onbGoalsTitle;

  /// No description provided for @onbGoalsSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Выбери от одной цели — можно несколько'**
  String get onbGoalsSubtitle;

  /// No description provided for @onbGoalNews.
  ///
  /// In ru, this message translates to:
  /// **'Понимать новости рынка'**
  String get onbGoalNews;

  /// No description provided for @onbGoalBias.
  ///
  /// In ru, this message translates to:
  /// **'Замечать свои ошибки'**
  String get onbGoalBias;

  /// No description provided for @onbGoalPortfolio.
  ///
  /// In ru, this message translates to:
  /// **'Управлять портфелем'**
  String get onbGoalPortfolio;

  /// No description provided for @onbGoalSaving.
  ///
  /// In ru, this message translates to:
  /// **'Регулярно откладывать'**
  String get onbGoalSaving;

  /// No description provided for @onbGoalsError.
  ///
  /// In ru, this message translates to:
  /// **'Выбери хотя бы одну цель'**
  String get onbGoalsError;

  /// No description provided for @onbRiskTitle.
  ///
  /// In ru, this message translates to:
  /// **'Насколько ты смелый?'**
  String get onbRiskTitle;

  /// No description provided for @onbRiskSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Так Coach подберёт уровень риска'**
  String get onbRiskSubtitle;

  /// No description provided for @onbRiskConservative.
  ///
  /// In ru, this message translates to:
  /// **'Осторожный'**
  String get onbRiskConservative;

  /// No description provided for @onbRiskConservativeDesc.
  ///
  /// In ru, this message translates to:
  /// **'Сохранность важнее доходности'**
  String get onbRiskConservativeDesc;

  /// No description provided for @onbRiskModerate.
  ///
  /// In ru, this message translates to:
  /// **'Умеренный'**
  String get onbRiskModerate;

  /// No description provided for @onbRiskModerateDesc.
  ///
  /// In ru, this message translates to:
  /// **'Баланс риска и доходности'**
  String get onbRiskModerateDesc;

  /// No description provided for @onbRiskAggressive.
  ///
  /// In ru, this message translates to:
  /// **'Смелый'**
  String get onbRiskAggressive;

  /// No description provided for @onbRiskAggressiveDesc.
  ///
  /// In ru, this message translates to:
  /// **'Готов к росту и волатильности'**
  String get onbRiskAggressiveDesc;

  /// No description provided for @onbStyleTitle.
  ///
  /// In ru, this message translates to:
  /// **'Как Coach говорит с тобой?'**
  String get onbStyleTitle;

  /// No description provided for @onbStyleDetailed.
  ///
  /// In ru, this message translates to:
  /// **'Подробно, с примерами'**
  String get onbStyleDetailed;

  /// No description provided for @onbStyleConcise.
  ///
  /// In ru, this message translates to:
  /// **'Кратко, по сути'**
  String get onbStyleConcise;

  /// No description provided for @onbCreateCoach.
  ///
  /// In ru, this message translates to:
  /// **'Создать Coach'**
  String get onbCreateCoach;

  /// No description provided for @onbCreatingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Создаём твоего Coach…'**
  String get onbCreatingTitle;

  /// No description provided for @onbCreatingText.
  ///
  /// In ru, this message translates to:
  /// **'Настраиваю тон общения и твой учебный портфель'**
  String get onbCreatingText;

  /// No description provided for @greetingMorning.
  ///
  /// In ru, this message translates to:
  /// **'Доброе утро, {name}!'**
  String greetingMorning(String name);

  /// No description provided for @greetingDay.
  ///
  /// In ru, this message translates to:
  /// **'Добрый день, {name}!'**
  String greetingDay(String name);

  /// No description provided for @greetingEvening.
  ///
  /// In ru, this message translates to:
  /// **'Добрый вечер, {name}!'**
  String greetingEvening(String name);

  /// No description provided for @greetingFallback.
  ///
  /// In ru, this message translates to:
  /// **'Привет!'**
  String get greetingFallback;

  /// No description provided for @discussNewsQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Расскажи про новость «{title}» и что она значит для моего портфеля'**
  String discussNewsQuestion(String title);

  /// No description provided for @discussLessonQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Давай обсудим урок «{title}» — помоги понять, как это применить'**
  String discussLessonQuestion(String title);

  /// No description provided for @aboutNews.
  ///
  /// In ru, this message translates to:
  /// **'О новости: {title}'**
  String aboutNews(String title);

  /// No description provided for @allocStocks.
  ///
  /// In ru, this message translates to:
  /// **'Акции'**
  String get allocStocks;

  /// No description provided for @allocBonds.
  ///
  /// In ru, this message translates to:
  /// **'Облигации'**
  String get allocBonds;

  /// No description provided for @allocEtf.
  ///
  /// In ru, this message translates to:
  /// **'Фонды'**
  String get allocEtf;

  /// No description provided for @allocOther.
  ///
  /// In ru, this message translates to:
  /// **'Прочее'**
  String get allocOther;

  /// No description provided for @portfolioPositions.
  ///
  /// In ru, this message translates to:
  /// **'Позиции'**
  String get portfolioPositions;

  /// No description provided for @portfolioTrades.
  ///
  /// In ru, this message translates to:
  /// **'Последние сделки'**
  String get portfolioTrades;

  /// No description provided for @portfolioEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Портфель ещё не создан. Coach подготовит его после онбординга.'**
  String get portfolioEmpty;

  /// No description provided for @tradeBuy.
  ///
  /// In ru, this message translates to:
  /// **'Покупка'**
  String get tradeBuy;

  /// No description provided for @tradeSell.
  ///
  /// In ru, this message translates to:
  /// **'Продажа'**
  String get tradeSell;

  /// No description provided for @todayImportant.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня важно'**
  String get todayImportant;

  /// No description provided for @quickActions.
  ///
  /// In ru, this message translates to:
  /// **'Быстрые вопросы'**
  String get quickActions;

  /// No description provided for @quickQ1.
  ///
  /// In ru, this message translates to:
  /// **'Что сегодня на рынке?'**
  String get quickQ1;

  /// No description provided for @quickQ2.
  ///
  /// In ru, this message translates to:
  /// **'Как мой портфель?'**
  String get quickQ2;

  /// No description provided for @quickQ3.
  ///
  /// In ru, this message translates to:
  /// **'Что такое диверсификация?'**
  String get quickQ3;

  /// No description provided for @quickQ4.
  ///
  /// In ru, this message translates to:
  /// **'Объясни проще'**
  String get quickQ4;

  /// No description provided for @chatInputHint.
  ///
  /// In ru, this message translates to:
  /// **'Спроси Coach что угодно…'**
  String get chatInputHint;

  /// No description provided for @coachFirstMessage.
  ///
  /// In ru, this message translates to:
  /// **'Привет, {name}! Я — твой Coach. Я помогу разобраться с новостями и делать взвешенные решения. Давай начнём с главного?'**
  String coachFirstMessage(String name);

  /// No description provided for @portfolioCardTitle.
  ///
  /// In ru, this message translates to:
  /// **'Твой портфель'**
  String get portfolioCardTitle;

  /// No description provided for @retry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get retry;

  /// No description provided for @somethingWentWrong.
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так'**
  String get somethingWentWrong;

  /// No description provided for @noNewsForToday.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня новостей пока нет — загляни позже'**
  String get noNewsForToday;

  /// No description provided for @newsFeedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новости дня'**
  String get newsFeedTitle;

  /// No description provided for @todayImportantDiscuss.
  ///
  /// In ru, this message translates to:
  /// **'Обсудить с Coach'**
  String get todayImportantDiscuss;

  /// No description provided for @newsImpactPortfolio.
  ///
  /// In ru, this message translates to:
  /// **'Влияет на твой портфель'**
  String get newsImpactPortfolio;

  /// No description provided for @newsNoImpact.
  ///
  /// In ru, this message translates to:
  /// **'На портфель не влияет'**
  String get newsNoImpact;

  /// No description provided for @chatThinking.
  ///
  /// In ru, this message translates to:
  /// **'Coach думает…'**
  String get chatThinking;

  /// No description provided for @paywallTitle.
  ///
  /// In ru, this message translates to:
  /// **'Вопросы на сегодня закончились'**
  String get paywallTitle;

  /// No description provided for @paywallText.
  ///
  /// In ru, this message translates to:
  /// **'Тариф Free — 8 вопросов в день. News+ за 149 ₽/мес — без ограничений.'**
  String get paywallText;

  /// No description provided for @paywallUpgrade.
  ///
  /// In ru, this message translates to:
  /// **'Перейти на News+'**
  String get paywallUpgrade;

  /// No description provided for @paywallLater.
  ///
  /// In ru, this message translates to:
  /// **'Позже'**
  String get paywallLater;

  /// No description provided for @paywallStubHint.
  ///
  /// In ru, this message translates to:
  /// **'Оплату подписки подключим в следующем обновлении'**
  String get paywallStubHint;

  /// No description provided for @voiceStart.
  ///
  /// In ru, this message translates to:
  /// **'Спроси голосом'**
  String get voiceStart;

  /// No description provided for @voiceListening.
  ///
  /// In ru, this message translates to:
  /// **'Слушаю тебя…'**
  String get voiceListening;

  /// No description provided for @voiceProcessing.
  ///
  /// In ru, this message translates to:
  /// **'Coach разбирает вопрос…'**
  String get voiceProcessing;

  /// No description provided for @voiceSpeaking.
  ///
  /// In ru, this message translates to:
  /// **'Coach отвечает'**
  String get voiceSpeaking;

  /// No description provided for @voiceDone.
  ///
  /// In ru, this message translates to:
  /// **'Готово'**
  String get voiceDone;

  /// No description provided for @voiceStop.
  ///
  /// In ru, this message translates to:
  /// **'Остановить'**
  String get voiceStop;

  /// No description provided for @voiceMockHint.
  ///
  /// In ru, this message translates to:
  /// **'Голос подключим в следующем обновлении, а пока Coach «слышит» тебя в демо-режиме'**
  String get voiceMockHint;

  /// No description provided for @voiceTapToStop.
  ///
  /// In ru, this message translates to:
  /// **'Тапни по микрофону, чтобы остановить'**
  String get voiceTapToStop;

  /// No description provided for @voiceMicUnavailable.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось открыть микрофон. Проверь разрешения в настройках устройства'**
  String get voiceMicUnavailable;

  /// No description provided for @voiceAskAgain.
  ///
  /// In ru, this message translates to:
  /// **'Спросить ещё'**
  String get voiceAskAgain;

  /// No description provided for @voiceClose.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get voiceClose;

  /// No description provided for @biasChip.
  ///
  /// In ru, this message translates to:
  /// **'Заметил: {bias}'**
  String biasChip(String bias);

  /// No description provided for @learnTabToday.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня'**
  String get learnTabToday;

  /// No description provided for @learnTabReviews.
  ///
  /// In ru, this message translates to:
  /// **'Weekly Reviews'**
  String get learnTabReviews;

  /// No description provided for @learnTabCases.
  ///
  /// In ru, this message translates to:
  /// **'Мои Кейсы'**
  String get learnTabCases;

  /// No description provided for @learnTabProgress.
  ///
  /// In ru, this message translates to:
  /// **'Прогресс'**
  String get learnTabProgress;

  /// No description provided for @learnLessonDuration.
  ///
  /// In ru, this message translates to:
  /// **'{seconds} сек'**
  String learnLessonDuration(int seconds);

  /// No description provided for @learnLessonStart.
  ///
  /// In ru, this message translates to:
  /// **'Пройти'**
  String get learnLessonStart;

  /// No description provided for @learnLessonDiscuss.
  ///
  /// In ru, this message translates to:
  /// **'Обсудить с Coach'**
  String get learnLessonDiscuss;

  /// No description provided for @learnLessonCompleted.
  ///
  /// In ru, this message translates to:
  /// **'Пройдено'**
  String get learnLessonCompleted;

  /// No description provided for @learnLessonComplete.
  ///
  /// In ru, this message translates to:
  /// **'Завершить'**
  String get learnLessonComplete;

  /// No description provided for @learnNoLessons.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня уроков нет — Coach подберёт новые завтра'**
  String get learnNoLessons;

  /// No description provided for @learnReviewScore.
  ///
  /// In ru, this message translates to:
  /// **'Process Score'**
  String get learnReviewScore;

  /// No description provided for @learnReviewInsights.
  ///
  /// In ru, this message translates to:
  /// **'Ключевые инсайты'**
  String get learnReviewInsights;

  /// No description provided for @learnReviewCompare.
  ///
  /// In ru, this message translates to:
  /// **'Сравнение с индексом'**
  String get learnReviewCompare;

  /// No description provided for @learnReviewYourReturn.
  ///
  /// In ru, this message translates to:
  /// **'Твой результат'**
  String get learnReviewYourReturn;

  /// No description provided for @learnReviewIndexReturn.
  ///
  /// In ru, this message translates to:
  /// **'Индекс'**
  String get learnReviewIndexReturn;

  /// No description provided for @learnReviewDiscuss.
  ///
  /// In ru, this message translates to:
  /// **'Обсудить с Coach'**
  String get learnReviewDiscuss;

  /// No description provided for @learnReviewEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Первый Weekly Review появится в конце недели'**
  String get learnReviewEmpty;

  /// No description provided for @learnReviewHistory.
  ///
  /// In ru, this message translates to:
  /// **'История'**
  String get learnReviewHistory;

  /// No description provided for @learnCasesEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Сохранённых кейсов пока нет. Обсуди новость с Coach и нажми «Сохранить»'**
  String get learnCasesEmpty;

  /// No description provided for @learnCasesSearch.
  ///
  /// In ru, this message translates to:
  /// **'Поиск по кейсам…'**
  String get learnCasesSearch;

  /// No description provided for @learnProgressStreak.
  ///
  /// In ru, this message translates to:
  /// **'Стрик'**
  String get learnProgressStreak;

  /// No description provided for @learnProgressStreakDays.
  ///
  /// In ru, this message translates to:
  /// **'{count} дн.'**
  String learnProgressStreakDays(int count);

  /// No description provided for @learnProgressAvg.
  ///
  /// In ru, this message translates to:
  /// **'Среднее в день'**
  String get learnProgressAvg;

  /// No description provided for @learnProgressAvgValue.
  ///
  /// In ru, this message translates to:
  /// **'{count} взаимодействий'**
  String learnProgressAvgValue(int count);

  /// No description provided for @learnProgressTopics.
  ///
  /// In ru, this message translates to:
  /// **'Топ темы'**
  String get learnProgressTopics;

  /// No description provided for @learnProgressBias.
  ///
  /// In ru, this message translates to:
  /// **'Bias-паттерны'**
  String get learnProgressBias;

  /// No description provided for @learnProgressEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Данных пока мало — возвращайся каждый день'**
  String get learnProgressEmpty;

  /// No description provided for @profileTitle.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profileTitle;

  /// No description provided for @profileTierFree.
  ///
  /// In ru, this message translates to:
  /// **'Free'**
  String get profileTierFree;

  /// No description provided for @profileTierNewsPlus.
  ///
  /// In ru, this message translates to:
  /// **'News+'**
  String get profileTierNewsPlus;

  /// No description provided for @profileTierPro.
  ///
  /// In ru, this message translates to:
  /// **'Pro'**
  String get profileTierPro;

  /// No description provided for @profileStats30.
  ///
  /// In ru, this message translates to:
  /// **'Статистика за 30 дней'**
  String get profileStats30;

  /// No description provided for @profileStreak.
  ///
  /// In ru, this message translates to:
  /// **'Стрик'**
  String get profileStreak;

  /// No description provided for @profileStreakValue.
  ///
  /// In ru, this message translates to:
  /// **'{count} дн. подряд'**
  String profileStreakValue(int count);

  /// No description provided for @profileAvgInteractions.
  ///
  /// In ru, this message translates to:
  /// **'Среднее в день'**
  String get profileAvgInteractions;

  /// No description provided for @profileAvgValue.
  ///
  /// In ru, this message translates to:
  /// **'{count} взаимодействий'**
  String profileAvgValue(int count);

  /// No description provided for @profileTopTopics.
  ///
  /// In ru, this message translates to:
  /// **'Любимые темы'**
  String get profileTopTopics;

  /// No description provided for @profileMyCoach.
  ///
  /// In ru, this message translates to:
  /// **'Мой Coach'**
  String get profileMyCoach;

  /// No description provided for @profileStyleTitle.
  ///
  /// In ru, this message translates to:
  /// **'Стиль общения'**
  String get profileStyleTitle;

  /// No description provided for @profileStyleDetailed.
  ///
  /// In ru, this message translates to:
  /// **'Подробно, с примерами'**
  String get profileStyleDetailed;

  /// No description provided for @profileStyleConcise.
  ///
  /// In ru, this message translates to:
  /// **'Кратко, по сути'**
  String get profileStyleConcise;

  /// No description provided for @profileStyleSaved.
  ///
  /// In ru, this message translates to:
  /// **'Стиль обновлён'**
  String get profileStyleSaved;

  /// No description provided for @profilePushTitle.
  ///
  /// In ru, this message translates to:
  /// **'Push-уведомления'**
  String get profilePushTitle;

  /// No description provided for @profilePushDaily.
  ///
  /// In ru, this message translates to:
  /// **'Новость дня'**
  String get profilePushDaily;

  /// No description provided for @profilePushReview.
  ///
  /// In ru, this message translates to:
  /// **'Weekly Review готов'**
  String get profilePushReview;

  /// No description provided for @profilePushLesson.
  ///
  /// In ru, this message translates to:
  /// **'Новый урок'**
  String get profilePushLesson;

  /// No description provided for @profileUpgradeTitle.
  ///
  /// In ru, this message translates to:
  /// **'News+ за 149 ₽/мес'**
  String get profileUpgradeTitle;

  /// No description provided for @profileUpgradeText.
  ///
  /// In ru, this message translates to:
  /// **'Безлимитные вопросы, все уроки, детальные разборы'**
  String get profileUpgradeText;

  /// No description provided for @profileUpgradeButton.
  ///
  /// In ru, this message translates to:
  /// **'Перейти на News+'**
  String get profileUpgradeButton;

  /// No description provided for @profileUpgradeFeatures.
  ///
  /// In ru, this message translates to:
  /// **'Что даёт News+'**
  String get profileUpgradeFeatures;

  /// No description provided for @profileFeatureUnlimited.
  ///
  /// In ru, this message translates to:
  /// **'Безлимитные Pull-запросы'**
  String get profileFeatureUnlimited;

  /// No description provided for @profileFeatureLessons.
  ///
  /// In ru, this message translates to:
  /// **'Все микро-уроки и разборы'**
  String get profileFeatureLessons;

  /// No description provided for @profileFeaturePriority.
  ///
  /// In ru, this message translates to:
  /// **'Приоритетная очередь Coach'**
  String get profileFeaturePriority;

  /// No description provided for @profileAbout.
  ///
  /// In ru, this message translates to:
  /// **'О приложении'**
  String get profileAbout;

  /// No description provided for @profileAboutVersion.
  ///
  /// In ru, this message translates to:
  /// **'Версия {version}'**
  String profileAboutVersion(String version);

  /// No description provided for @profileAboutDisclaimer.
  ///
  /// In ru, this message translates to:
  /// **'InvestCoach — образовательное приложение. Не является индивидуальной инвестиционной рекомендацией.'**
  String get profileAboutDisclaimer;

  /// No description provided for @profilePullLeft.
  ///
  /// In ru, this message translates to:
  /// **'Осталось вопросов: {left} из {limit}'**
  String profilePullLeft(int left, int limit);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
