import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_stacked/app/app.bottomsheets.dart';
import 'package:todo_stacked/app/app.dialogs.dart';
import 'package:todo_stacked/app/app.locator.dart';
import 'package:todo_stacked/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ckouknkmzuuuozmmyvzk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNrb3VrbmttenV1dW96bW15dnprIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg0Mzc1MzcsImV4cCI6MjAyNDAxMzUzN30.redkkPm7dc2ech3Fo-8PZifAO-Ymsmi9ePsE8wKloxk',
  );
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.homeView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
