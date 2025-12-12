import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:task_manager/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:task_manager/features/tasks/presentation/views/all_tasks_view.dart';
import 'package:task_manager/features/tasks/presentation/views/calendar_view.dart';

import '../../../features/profile/presentation/views/profile_page.dart';
import '../../../features/tasks/presentation/views/search_filter_view.dart';

class MainScaffoldPage extends HookWidget {
  const MainScaffoldPage({super.key});

  get pages => [
    TasksListView(),
    SearchFilterView(),
    CalendarView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    return Scaffold(
      body: pages[currentIndex.value],
      bottomNavigationBar: BottomNavBarWidget(currentIndex: currentIndex),
    );
  }
}
