import 'package:Queszz/main/factories/makeHomeViewModel.dart';
import 'package:Queszz/main/factories/makeLevelsViewModel.dart';
import 'package:Queszz/main/factories/makeScoreViewModel.dart';
import 'package:Queszz/ui/home/home_screen.dart';
import 'package:Queszz/ui/levels/levels_screen.dart';
import 'package:Queszz/ui/questions/questions_screen.dart';
import 'package:Queszz/ui/score/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'main/factories/makeQuestionsViewModel.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Queszz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0XFF3F3D56),
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('pt', 'BR'),
      ],
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
      },
    );
  }
}
