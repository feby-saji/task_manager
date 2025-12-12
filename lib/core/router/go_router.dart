import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/core/router/app_routes.dart';
import 'package:task_manager/features/auth/presentation/pages/login_page.dart';
import 'package:task_manager/features/auth/presentation/state/auth_state.dart';
import 'package:task_manager/features/tasks/presentation/pages/task_details_page.dart';

import '../../features/auth/presentation/notifiers/auth_notifier.dart';
import '../presentation/main_scaffold.dart';

final goRouterProvider = Provider((ref) {
  final authState = ref.watch(authNotifierProvider);
  return GoRouter(
    redirect: (context, state) => authRedirect(state, authState),
    routes: <RouteBase>[
      GoRoute(path: '/', redirect: (_, __) => AppRoutes.main),
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

String? authRedirect(GoRouterState state, AuthStateR authState) {
  final bool isLoggedIn = authState is AuthSuccessState;

  final String currentPath = state.uri.path;

  final bool onLoginPage = currentPath == AppRoutes.login;
  // final bool onMainPage = currentPath == AppRoutes.main;

  if (!isLoggedIn && !onLoginPage) {
    return AppRoutes.login;
  }

  if (isLoggedIn && onLoginPage) {
    return AppRoutes.main;
  }

  return null;
}
