import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/navigation/router.dart';
import 'core/theme/app_theme.dart';
import 'core/notifications/reminder_scheduler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ReminderScheduler.init();
  
  runApp(
    const ProviderScope(
      child: LifeOsApp(),
    ),
  );
}

class LifeOsApp extends ConsumerWidget {
  const LifeOsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'LifeOS',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // TODO: bind to settings provider
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
