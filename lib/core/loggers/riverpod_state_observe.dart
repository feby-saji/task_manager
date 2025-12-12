// A basic logger, which logs any state changes.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/core/loggers/app_logger.dart';

final class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    AppLogger.d('''
{
  "provider": "${context.provider}",
  "previousValue": "$previousValue",
  "newValue": "$newValue",
  "mutation": "${context.mutation}"
}''');
  }
}
