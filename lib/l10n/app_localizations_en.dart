// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'InvestCoach';

  @override
  String get tabCoach => 'Coach';

  @override
  String get tabNews => 'News';

  @override
  String get tabPortfolio => 'Portfolio';

  @override
  String get tabLearning => 'Learning';

  @override
  String get tabProfile => 'Profile';

  @override
  String get coachOnline => 'Online';

  @override
  String get coachOffline => 'Offline';

  @override
  String get onboardingTitle => 'Onboarding';

  @override
  String get featureInDevelopment => 'In development';

  @override
  String featureInDevelopmentDesc(String feature, String sprint) {
    return 'The \"$feature\" screen will appear in $sprint.';
  }

  @override
  String get sprint1to2 => 'sprints 1-2';

  @override
  String get sprint3 => 'sprint 3';

  @override
  String get sprint4 => 'sprint 4';

  @override
  String get onbWelcomeTitle => 'Meet your Coach';

  @override
  String get onbWelcomeText =>
      'Every day we review Russian market news together and learn to make calm, thoughtful decisions. It will take less than a minute.';

  @override
  String get onbWelcomeStart => 'Let\'s start';

  @override
  String onbStep(int step, int total) {
    return 'Step $step of $total';
  }

  @override
  String get onbNameTitle => 'What\'s your name?';

  @override
  String get onbNameSubtitle => 'Coach will address you by your name';

  @override
  String get onbNameHint => 'Your name';

  @override
  String get onbNameError => 'Enter your name — at least 2 characters';

  @override
  String get onbContinue => 'Continue';

  @override
  String get onbBack => 'Back';

  @override
  String get onbExperienceTitle => 'Your investing experience';

  @override
  String get onbExperienceSubtitle => 'I\'ll tailor explanations to your level';

  @override
  String get onbExpBeginner => 'I\'m a beginner';

  @override
  String get onbExpBeginnerDesc => 'I\'ve never invested';

  @override
  String get onbExpIntermediate => 'I know the basics';

  @override
  String get onbExpIntermediateDesc => 'I know what stocks and bonds are';

  @override
  String get onbExpAdvanced => 'Experienced investor';

  @override
  String get onbExpAdvancedDesc => 'I invest regularly';

  @override
  String get onbGoalsTitle => 'What are we working on?';

  @override
  String get onbGoalsSubtitle => 'Pick at least one goal — more is fine';

  @override
  String get onbGoalNews => 'Understand market news';

  @override
  String get onbGoalBias => 'Spot my mistakes';

  @override
  String get onbGoalPortfolio => 'Manage a portfolio';

  @override
  String get onbGoalSaving => 'Save regularly';

  @override
  String get onbGoalsError => 'Pick at least one goal';

  @override
  String get onbRiskTitle => 'How bold are you?';

  @override
  String get onbRiskSubtitle => 'Coach will match this risk level';

  @override
  String get onbRiskConservative => 'Cautious';

  @override
  String get onbRiskConservativeDesc => 'Safety matters more than returns';

  @override
  String get onbRiskModerate => 'Moderate';

  @override
  String get onbRiskModerateDesc => 'Balance of risk and return';

  @override
  String get onbRiskAggressive => 'Bold';

  @override
  String get onbRiskAggressiveDesc => 'Ready for growth and volatility';

  @override
  String get onbStyleTitle => 'How should Coach talk to you?';

  @override
  String get onbStyleDetailed => 'In detail, with examples';

  @override
  String get onbStyleConcise => 'Brief, to the point';

  @override
  String get onbCreateCoach => 'Create my Coach';

  @override
  String get onbCreatingTitle => 'Creating your Coach…';

  @override
  String get onbCreatingText =>
      'Setting up the tone and your learning portfolio';

  @override
  String greetingMorning(String name) {
    return 'Good morning, $name!';
  }

  @override
  String greetingDay(String name) {
    return 'Good afternoon, $name!';
  }

  @override
  String greetingEvening(String name) {
    return 'Good evening, $name!';
  }

  @override
  String get greetingFallback => 'Hi!';

  @override
  String discussNewsQuestion(String title) {
    return 'Tell me about the news \"$title\" and what it means for my portfolio';
  }

  @override
  String discussLessonQuestion(String title) {
    return 'Let\'s discuss the lesson \"$title\" — help me understand how to apply it';
  }

  @override
  String aboutNews(String title) {
    return 'About the news: $title';
  }

  @override
  String get allocStocks => 'Stocks';

  @override
  String get allocBonds => 'Bonds';

  @override
  String get allocEtf => 'Funds';

  @override
  String get allocOther => 'Other';

  @override
  String get portfolioPositions => 'Positions';

  @override
  String get portfolioTrades => 'Recent Trades';

  @override
  String get portfolioEmpty =>
      'Portfolio not created yet. Coach will set it up after onboarding.';

  @override
  String get tradeBuy => 'Buy';

  @override
  String get tradeSell => 'Sell';

  @override
  String get todayImportant => 'Important today';

  @override
  String get quickActions => 'Quick questions';

  @override
  String get quickQ1 => 'What\'s happening in the market today?';

  @override
  String get quickQ2 => 'How is my portfolio?';

  @override
  String get quickQ3 => 'What is diversification?';

  @override
  String get quickQ4 => 'Explain it simply';

  @override
  String get chatInputHint => 'Ask Coach anything…';

  @override
  String coachFirstMessage(String name) {
    return 'Hi, $name! I\'m your Coach. I\'ll help you make sense of the news and make thoughtful decisions. Let\'s start with the most important thing?';
  }

  @override
  String get portfolioCardTitle => 'Your portfolio';

  @override
  String get retry => 'Retry';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get noNewsForToday => 'No news yet today — check back later';

  @override
  String get newsFeedTitle => 'Today\'s News';

  @override
  String get todayImportantDiscuss => 'Discuss with Coach';

  @override
  String get newsImpactPortfolio => 'Affects your portfolio';

  @override
  String get newsNoImpact => 'No portfolio impact';

  @override
  String get chatThinking => 'Coach is thinking…';

  @override
  String get paywallTitle => 'You\'re out of questions for today';

  @override
  String get paywallText =>
      'Free plan includes 8 questions a day. News+ at 149 ₽/month removes the limit.';

  @override
  String get paywallUpgrade => 'Upgrade to News+';

  @override
  String get paywallLater => 'Later';

  @override
  String get paywallStubHint =>
      'Subscription checkout will arrive in the next update';

  @override
  String get voiceStart => 'Ask by voice';

  @override
  String get voiceListening => 'Listening…';

  @override
  String get voiceProcessing => 'Coach is thinking through it…';

  @override
  String get voiceSpeaking => 'Coach is answering';

  @override
  String get voiceDone => 'Done';

  @override
  String get voiceStop => 'Stop';

  @override
  String get voiceMockHint =>
      'Real voice arrives in the next update; for now Coach \"hears\" you in demo mode';

  @override
  String get voiceTapToStop => 'Tap the mic to stop';

  @override
  String get voiceMicUnavailable =>
      'We couldn\'t open the microphone. Check your device permissions';

  @override
  String get voiceAskAgain => 'Ask again';

  @override
  String get voiceClose => 'Close';

  @override
  String biasChip(String bias) {
    return 'Spotted: $bias';
  }

  @override
  String get learnTabToday => 'Today';

  @override
  String get learnTabReviews => 'Weekly Reviews';

  @override
  String get learnTabCases => 'My Cases';

  @override
  String get learnTabProgress => 'Progress';

  @override
  String learnLessonDuration(int seconds) {
    return '$seconds sec';
  }

  @override
  String get learnLessonStart => 'Start';

  @override
  String get learnLessonDiscuss => 'Discuss with Coach';

  @override
  String get learnLessonCompleted => 'Completed';

  @override
  String get learnLessonComplete => 'Finish';

  @override
  String get learnNoLessons =>
      'No lessons today — Coach will pick new ones tomorrow';

  @override
  String get learnReviewScore => 'Process Score';

  @override
  String get learnReviewInsights => 'Key Insights';

  @override
  String get learnReviewCompare => 'Portfolio vs Index';

  @override
  String get learnReviewYourReturn => 'Your return';

  @override
  String get learnReviewIndexReturn => 'Index';

  @override
  String get learnReviewDiscuss => 'Discuss with Coach';

  @override
  String get learnReviewEmpty =>
      'Your first Weekly Review will appear at the end of the week';

  @override
  String get learnReviewHistory => 'History';

  @override
  String get learnCasesEmpty =>
      'No saved cases yet. Discuss a news story with Coach and tap \"Save\"';

  @override
  String get learnCasesSearch => 'Search cases…';

  @override
  String get learnProgressStreak => 'Streak';

  @override
  String learnProgressStreakDays(int count) {
    return '$count days';
  }

  @override
  String get learnProgressAvg => 'Avg per day';

  @override
  String learnProgressAvgValue(int count) {
    return '$count interactions';
  }

  @override
  String get learnProgressTopics => 'Top Topics';

  @override
  String get learnProgressBias => 'Bias Patterns';

  @override
  String get learnProgressEmpty => 'Not enough data yet — come back every day';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileTierFree => 'Free';

  @override
  String get profileTierNewsPlus => 'News+';

  @override
  String get profileTierPro => 'Pro';

  @override
  String get profileStats30 => '30-Day Stats';

  @override
  String get profileStreak => 'Streak';

  @override
  String profileStreakValue(int count) {
    return '$count days in a row';
  }

  @override
  String get profileAvgInteractions => 'Avg per day';

  @override
  String profileAvgValue(int count) {
    return '$count interactions';
  }

  @override
  String get profileTopTopics => 'Favorite Topics';

  @override
  String get profileMyCoach => 'My Coach';

  @override
  String get profileStyleTitle => 'Communication Style';

  @override
  String get profileStyleDetailed => 'Detailed, with examples';

  @override
  String get profileStyleConcise => 'Concise, to the point';

  @override
  String get profileStyleSaved => 'Style updated';

  @override
  String get profilePushTitle => 'Push Notifications';

  @override
  String get profilePushDaily => 'Daily News';

  @override
  String get profilePushReview => 'Weekly Review Ready';

  @override
  String get profilePushLesson => 'New Lesson';

  @override
  String get profileUpgradeTitle => 'News+ at 149 ₽/month';

  @override
  String get profileUpgradeText =>
      'Unlimited questions, all lessons, detailed reviews';

  @override
  String get profileUpgradeButton => 'Upgrade to News+';

  @override
  String get profileUpgradeFeatures => 'What News+ gives you';

  @override
  String get profileFeatureUnlimited => 'Unlimited Pull requests';

  @override
  String get profileFeatureLessons => 'All micro-lessons and reviews';

  @override
  String get profileFeaturePriority => 'Priority Coach queue';

  @override
  String get profileAbout => 'About the App';

  @override
  String profileAboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get profileAboutDisclaimer =>
      'InvestCoach is an educational app. It does not constitute individual investment advice.';

  @override
  String profilePullLeft(int left, int limit) {
    return 'Questions left: $left of $limit';
  }

  @override
  String get themeSelectTitle => 'Choose your theme';

  @override
  String get themeSelectSubtitle =>
      'Every morning starts with a mood. Pick yours.';

  @override
  String get themeSelectStart => 'Get Started';

  @override
  String get profileThemeSection => 'Interface Theme';

  @override
  String get profileThemeHint => 'You can change it anytime';

  @override
  String get themeDark => 'Dark theme';

  @override
  String get themeLight => 'Light theme';

  @override
  String get offlineBanner =>
      'Вы оффлайн. Coach ответит, когда появится связь.';
}
