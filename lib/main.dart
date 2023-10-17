import 'dart:convert';

import 'package:currency_task/app_widget.dart';
import 'package:currency_task/src/core/constants/constants.export.dart';
import 'package:currency_task/src/core/injection/inj.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //load jsonTheme
  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  configureDependencies(env: ValueConstants.dev);
  runApp(AppWidget(themeData: theme));
}
