class DateTimeUtils {
  /// Converts DateTime → ISO8601 string for DB/storage
  static String toDbString(DateTime date) => date.toUtc().toIso8601String();

  /// Converts ISO8601 string from DB → DateTime
  static DateTime fromDbString(String dateStr) => DateTime.parse(dateStr);

  static String toDisplayString(DateTime date) =>
      '${date.day}/${date.month}/${date.year}';
}
