import 'package:Queszz/presentation/controllers/language_controller.dart';
import 'package:Queszz/presentation/controllers/theme_controller.dart';
import 'package:Queszz/themes.dart';
import 'package:Queszz/ui/home/home_screen.dart';
import 'package:Queszz/ui/leadboard/leadboard_screen.dart';
import 'package:Queszz/ui/levels/levels_screen.dart';
import 'package:Queszz/ui/questions/questions_screen.dart';
import 'package:Queszz/ui/score/score_screen.dart';
import 'package:Queszz/ui/settings/settings_screen.dart';
import 'package:Queszz/ui/statistics/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'main/controllers/makeAuthenticationController.dart';
import 'main/factories/makeHomeViewModel.dart';
import 'main/factories/makeLevelsViewModel.dart';
import 'main/factories/makeQuestionsViewModel.dart';
import 'main/factories/makeScoreViewModel.dart';
import 'main/factories/makeStatisticsViewModel.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeController.instance,
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageController.instance,
        ),
        ChangeNotifierProvider(
          create: (context) => makeAuthenticationController(),
        ),
      ],
      child: Consumer<LanguageController>(
        builder: (context, languageController, __) => Consumer<ThemeController>(
          builder: (context, themeController, _) => MaterialApp(
            title: 'Queszz',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                themeController.isDark ? ThemeMode.dark : ThemeMode.light,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', 'US'),
              const Locale('pt', 'BR'),
            ],
            locale: languageController.currentLocale,
            initialRoute: '/home',
            onGenerateRoute: (settings) {
              if (settings.name == '/levels') {
                final args = settings.arguments as Map;

                return MaterialPageRoute(
                  builder: (context) {
                    return ChangeNotifierProvider(
                      create: (context) => makeLevelsViewModel(),
                      child: LevelsScreen(
                        category: args['category'],
                      ),
                    );
                  },
                );
              }

              if (settings.name == '/questions') {
                final args = settings.arguments as Map;

                return MaterialPageRoute(
                  builder: (context) {
                    return ChangeNotifierProvider(
                      create: (context) => makeQuestionsViewModel(),
                      child: QuestionsScreen(
                        level: args['level'],
                        category: args['category'],
                      ),
                    );
                  },
                );
              }

              if (settings.name == '/score') {
                final args = settings.arguments as Map;

                return MaterialPageRoute(
                  builder: (context) {
                    return ChangeNotifierProvider(
                      create: (context) => makeScoreViewModel(),
                      child: ScoreScreen(
                        level: args['level'],
                        category: args['category'],
                        correctAnswers: args['correctAnswers'],
                        wrongAnswers: args['wrongAnswers'],
                        skipedAnswers: args['skipedAnswers'],
                      ),
                    );
                  },
                );
              }

              return null;
            },
            routes: {
              '/home': (context) => ChangeNotifierProvider(
                    create: (context) => makeHomeViewModel(),
                    child: HomeScreen(),
                  ),
              '/statistics': (context) => ChangeNotifierProvider(
                    create: (context) => makeStatisticsViewModel(),
                    child: StatisticsScreen(),
                  ),
              '/settings': (context) => SettingsScreen(),
              '/leadboard': (context) => LeadboardScreen(),
            },
          ),
        ),
      ),
    );
  }
}
