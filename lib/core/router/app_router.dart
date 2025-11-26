import 'package:go_router/go_router.dart';
import 'package:task_manager/core/presentation/main_scaffold.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScaffoldPage(),
    ),
    // GoRoute(
    //   path: '/task/:id',
    //   builder: (context, state) {
    //     final taskId = state.params['id']!;
    //     return TaskDetailScreen(taskId: taskId);
    //   },
    // ),
    // GoRoute(
    //   path: '/calendar',
    //   builder: (context, state) => const CalendarScreen(),
    // ),
    // GoRoute(
    //   path: '/search',
    //   builder: (context, state) => const SearchFilterScreen(),
    // ),
    // GoRoute(
    //   path: '/settings',
    //   builder: (context, state) => const SettingsScreen(),
    // ),
  ],
);
