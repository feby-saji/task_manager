import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_manager/core/loggers/app_logger.dart';

class BottomNavBarWidget extends StatelessWidget {
  final ValueNotifier<int> currentIndex;

  const BottomNavBarWidget({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    AppLogger.d('BottomNavBarWidget build');

    return BottomNavigationBar(
      currentIndex: currentIndex.value,
      onTap: (newIndex) => currentIndex.value = newIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        /// TASKS
        BottomNavigationBarItem(
          label: 'Tasks',
          icon: Icon(FluentIcons.task_list_ltr_24_regular),
          activeIcon: Icon(FluentIcons.task_list_ltr_24_filled),
        ),

        /// SEARCH & FILTER
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(FluentIcons.filter_12_regular),
          activeIcon: Icon(FluentIcons.filter_12_filled),
        ),

        /// CALENDAR
        BottomNavigationBarItem(
          label: 'Calendar',
          icon: Icon(FluentIcons.calendar_ltr_12_regular),
          activeIcon: Icon(FontAwesomeIcons.calendar),
        ),

        /// SETTINGS
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Icon(FluentIcons.settings_16_regular),
          activeIcon: Icon(FluentIcons.settings_16_filled),
        ),
      ],
    );
  }
}
