import 'package:Queszz/app_widget.dart';
import 'package:Queszz/external/services/database.dart';
import 'package:Queszz/presentation/controllers/language_controller.dart';
import 'package:Queszz/presentation/controllers/theme_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await DatabaseHelper().initDb();

  LanguageController.instance = LanguageController();

  await LanguageController.instance.loadLocale();

  ThemeController.instance = ThemeController();

  await ThemeController.instance.load();

  runApp(App());
}
