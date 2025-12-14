import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/core/router/app_routes.dart';
import 'package:task_manager/features/auth/presentation/pages/login_page.dart';
import 'package:task_manager/features/tasks/presentation/pages/task_details_page.dart';

import '../../features/auth/presentation/notifiers/providers.dart';
import '../presentation/main_scaffold.dart';

final goRouterProvider = Provider((ref) {
  final authNotifier = ref.watch(
    authNotifierProvider.notifier,
  ); // Watch the notifier
  return GoRouter(
    refreshListenable: authNotifier,
    initialLocation: AppRoutes.main,
    redirect: (context, state) => authNotifier.authRedirect(state),
    // Pass authNotifier.state
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.main,
        builder: (BuildContext context, GoRouterState state) {
          return const MainScaffoldPage();
        },
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      // GoRoute(
      //   path: AppRoutes.profile,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const ProfilePage();
      //   },
      // ),
      GoRoute(
        path: '${AppRoutes.task}/:taskId',
        builder: (BuildContext context, GoRouterState state) {
          return TaskDetailsPage(taskId: state.pathParameters['taskId']!);
        },
      ),
    ],
  );
});
