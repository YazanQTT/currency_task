import 'package:flutter/material.dart';
import '../../../app_widget.dart';
import '../../shared/shared.export.dart';

ThemeData easyTheme() => Theme.of(navigatorKey.currentState!.context);

void showErrorSnackBar(String text, {Duration duration = const Duration(seconds: 2)}) {
  ScaffoldMessenger.of(navigatorKey.currentState!.context).clearSnackBars();
  ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(SnackBarError(text, duration));
}

void showSuccessSnackBar(String text, {Duration duration = const Duration(seconds: 2)}) {
  ScaffoldMessenger.of(navigatorKey.currentState!.context).clearSnackBars();
  ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(SnackBarSuccess(text, duration));
}