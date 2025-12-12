class DateTimeUtils {
  /// Converts DateTime → int to store in db
  static int toLocalDbTime(DateTime dt) {
    return dt.toUtc().millisecondsSinceEpoch;
  }

  static int nowLocalDbTime() {
    return DateTime.now().toUtc().millisecondsSinceEpoch;
  }

  // Converts int → Timestampz for supabase
  static String toSupabaseTime(int ms) {
    return DateTime.fromMillisecondsSinceEpoch(
      ms,
      isUtc: true,
    ).toIso8601String();
  }

  static String toDisplayString(DateTime date) =>
      '${date.day}/${date.month}/${date.year}';
}
