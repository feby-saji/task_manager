import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/core/app_initializer.dart';
import 'package:task_manager/core/loggers/riverpod_state_observe.dart';
import 'package:task_manager/core/router/go_router.dart';
import 'package:task_manager/core/theme/app_theme.dart';

void main() async {
  await AppInitializer.initialize();
  runApp(
    ProviderScope(
      observers: [ProviderLogger()],
      child: EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('de', 'DE')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        startLocale: Locale('en', 'US'),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Task Manager',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
