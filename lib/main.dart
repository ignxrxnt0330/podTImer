import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:podtimer/config/router/app_router.dart';
import 'package:podtimer/config/theme/app_theme.dart';
import 'package:podtimer/data/datasource.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  Datasource().getAccessToken();
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
