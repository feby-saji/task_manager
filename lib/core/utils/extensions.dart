import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/core/router/app_routes.dart';
import 'package:task_manager/core/theme/app_theme.dart'; // Import for AppColors
import 'package:task_manager/core/utils/enums.dart'; // Import for SnackBarType

extension BoolDbExt on bool {
  int toDb() => this ? 1 : 0;

  bool fromDb(int bool) => bool == 1 ? true : false;
}

class EnumDbExt {
  static String toDb(Enum e) => e.name;

  static T fromDb<T extends Enum>(List<T> values, String value) {
    return values.firstWhere((element) => element.name == value);
  }
}

extension AppNavigationExt on BuildContext {
  void goToMain() => go(AppRoutes.main);

  void goToLogin() => go(AppRoutes.login);

  void goToProfile() => push(AppRoutes.profile);

  void goToTask(String taskId) => push(AppRoutes.taskDetails(taskId));

  void goBack() => pop();
}

extension UiExt on BuildContext {
  void showSnack(String message, {SnackBarType type = SnackBarType.info}) {
    // Get the current theme's colors.
    final theme = Theme.of(this);
    final colorScheme = theme.colorScheme;
    final isDarkMode = theme.brightness == Brightness.dark;

    // Determine the colors and icon based on the snackbar type.
    Color backgroundColor;
    Color textColor;
    IconData iconData;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = isDarkMode
            ? AppColors.darkSuccess
            : AppColors.lightSuccess;
        iconData = Icons.check_circle_outline;
        break;
      case SnackBarType.error:
        backgroundColor = colorScheme.error; // Use the theme's error color
        iconData = Icons.error_outline;
        break;
      case SnackBarType.info:
      default:
        // Using a slightly toned-down primary color for info.
        backgroundColor = colorScheme.primary.withOpacity(0.9);
        iconData = Icons.info_outline;
        break;
    }

    // For high contrast, we'll use a white text color on the colored backgrounds.
    textColor = Colors.white;

    // Hide the current snackbar if one is showing.
    ScaffoldMessenger.of(this).hideCurrentSnackBar();

    // Show the new snackbar.
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        // For a modern look, we make the snackbar float above the content.
        behavior: SnackBarBehavior.floating,
        // Rounded corners are a standard modern design element.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // Add a margin to the floating snackbar.
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        content: Row(
          children: [
            Icon(iconData, color: textColor, size: 24.0),
            const SizedBox(width: 12.0),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
