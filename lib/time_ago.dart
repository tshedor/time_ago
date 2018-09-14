/// Determine the time passed since a supplied [date].
///
/// For mocking or other time manipulations, manually set `now`:
class TimeAgo {
  /// A past date
  final DateTime date;

  /// Time between `now` (from initializer) and [date]
  final Duration difference;

  TimeAgo(
    this.date,
    {
      /// Original, referenced date; assumes current time otherwise
      DateTime now
    }
  )
    : assert((now ?? DateTime.now()).isAfter(date),
          "Supplied date is in the future"),
      difference = (now ?? DateTime.now()).difference(date);

  /// Time ago in seconds
  String get inSeconds {
    return _pluralizeAgo(difference.inSeconds, "second");
  }

  /// Time ago in minutes
  String get inMinutes {
    return _pluralizeAgo(difference.inMinutes, "minute");
  }

  /// Time ago in hours
  String get inHours {
    return _pluralizeAgo(difference.inHours, "hour");
  }

  /// Time ago in days
  String get inDays {
    return _pluralizeAgo(difference.inDays, "day");
  }

  /// Time ago in weeks
  String get inWeeks {
    final count = _roundForRemainder(difference.inDays, 7);
    return _pluralizeAgo(count, "week");
  }

  /// Time ago in months
  String get inMonths {
    final count = _roundForRemainder(difference.inDays, 30);
    return _pluralizeAgo(count, "month");
  }

  /// Time ago in years
  String get inYears {
    final count = _roundForRemainder(difference.inDays, 365);
    return _pluralizeAgo(count, "year");
  }

  /// Convert past date to human-readable format
  String format() {
    if (difference.inSeconds < 60) return inSeconds;

    if (difference.inMinutes < 60) return inMinutes;

    if (difference.inHours < 24) return inHours;

    if (difference.inDays == 1) return "Yesterday";

    if (difference.inDays < 7) return inDays;

    if (difference.inDays < 32) return inWeeks;

    if (difference.inDays < 365) return inMonths;

    return inYears;
  }

  /// Round
  int _roundForRemainder(int count, int divisor) {
    final divided = count / divisor;
    return divided.round();
  }

  String _pluralize(int count, String singular, [String plural]) {
    if (count == 1) return singular;

    if (plural == null) return "${singular}s";

    return plural;
  }

  String _pluralizeAgo(int count, String singular, [String plural]) {
    final word = _pluralize(count, singular, plural);

    return "$count $word ago";
  }

  @override
  String toString() => format();
}
