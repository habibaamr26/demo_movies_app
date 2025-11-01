import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:week6_task/my_app.dart';
Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://6d7e92039e26045863d4d9bb7016297b@o4510246276694016.ingest.us.sentry.io/4510280393097216';
      options.tracesSampleRate = 1.0; // For performance monitoring
    },
    appRunner: () => runApp(const MyApp()),
  );
}