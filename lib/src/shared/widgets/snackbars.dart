import 'package:currency_task/src/core/core.export.dart';

SnackBar SnackBarError(String text, Duration duration) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: duration,
    backgroundColor: Colors.red.shade900,
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: easyTheme().textTheme.titleMedium,
    ),
  );
}

SnackBar SnackBarSuccess(String text, Duration duration) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: duration,
    backgroundColor: Colors.green.shade900,
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: easyTheme().textTheme.titleMedium,
    ),
  );
}
