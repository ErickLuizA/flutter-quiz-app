import 'package:Queszz/app_widget.dart';
import 'package:Queszz/external/services/database.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseHelper().initDb();

  runApp(App());
}
