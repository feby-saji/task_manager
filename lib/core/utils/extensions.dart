extension BoolDb on bool {
  int toDb() => this ? 1 : 0;

  bool fromDb(int bool) => bool == 1 ? true : false;
}

class EnumDb {
  static String toDb(Enum e) => e.name;

  static T fromDb<T extends Enum>(List<T> values, String value) {
    return values.firstWhere((element) => element.name == value);
  }
}
