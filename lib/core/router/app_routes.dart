class AppRoutes {
  static String login = '/login';
  static String main = '/main';

  // static String profile = '/profile';
  static String task = '/task';

  static taskDetails(String taskId) => '$task/$taskId';
}
