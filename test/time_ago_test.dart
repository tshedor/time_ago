import "package:test/test.dart";

import 'package:time_ago/time_ago.dart';

final kMockThen = DateTime(1938, 10, 30, 20, 0, 0);
final kMockNow = DateTime(1940, 10, 28, 14, 30, 0);

main() {
  group("TimeAgo", () {
    group("initialization", () {
      test("supplied date is in the past", () {
        final timeAgo = TimeAgo(kMockThen, now: kMockNow);

        expect(timeAgo.date, kMockThen);
      });

      test("instantiation uses .now()", () {
        final timeAgo = TimeAgo(kMockThen);

        expect(timeAgo.date, kMockThen);
      });

      test("supplied date is in the future", () {
        // I'd rather write this throwsA(AssertionError)
        //   but the test fails. Works with TypeMatcher
        expect(() => TimeAgo(kMockNow, now: kMockThen),
            throwsA(new TypeMatcher<AssertionError>()));
      });
    });

    group("instance variables", () {
      final timeAgo = TimeAgo(kMockThen, now: kMockNow);

      test(".inSeconds", () {
        expect(timeAgo.inSeconds, "62965800 seconds ago");
      });

      test(".inMinutes", () {
        expect(timeAgo.inMinutes, "1049430 minutes ago");
      });

      test(".inHours", () {
        expect(timeAgo.inHours, "17490 hours ago");
      });

      test(".inDays", () {
        expect(timeAgo.inDays, "728 days ago");
      });

      test(".inWeeks", () {
        expect(timeAgo.inWeeks, "104 weeks ago");
      });

      test(".inMonths", () {
        expect(timeAgo.inMonths, "24 months ago");
      });

      test(".inYears", () {
        expect(timeAgo.inYears, "2 years ago");
      });
    });

    group(".format", () {
      test("under a minute with 1 second", () {
        final now = kMockThen.add(Duration(seconds: 1));
        final timeAgo = TimeAgo(kMockThen, now: now);

        expect(timeAgo.format(), "1 second ago");
      });

      test("under a minute with multiple seconds", () {
        final now = kMockThen.add(Duration(seconds: 30));
        final timeAgo = TimeAgo(kMockThen, now: now);

        expect(timeAgo.format(), "30 seconds ago");
      });

      test("under an hour", () {
        final now = kMockThen.add(Duration(minutes: 59));
        final timeAgo = TimeAgo(kMockThen, now: now);

        expect(timeAgo.format(), "59 minutes ago");
      });

      test("an hour in the past", () {
        final now = kMockThen.add(Duration(hours: 1));
        final timeAgo = TimeAgo(kMockThen, now: now);

        expect(timeAgo.format(), "1 hour ago");
      });

      test("some hours in the past", () {
        final now = kMockThen.add(Duration(hours: 8));
        final timeAgo = TimeAgo(kMockThen, now: now);
        expect(timeAgo.format(), "8 hours ago");
      });

      test("yesterday", () {
        final now = kMockThen.add(Duration(days: 1));
        final timeAgo = TimeAgo(kMockThen, now: now);

        expect(timeAgo.format(), "Yesterday");
      });

      test("some days in the past", () {
        final now = kMockThen.add(Duration(days: 3));
        final timeAgo = TimeAgo(kMockThen, now: now);

        expect(timeAgo.format(), "3 days ago");
      });

      test("some weeks in the past", () {
        final now = kMockThen.add(Duration(days: 13));
        final timeAgo = TimeAgo(kMockThen, now: now);

        expect(timeAgo.format(), "2 weeks ago");
      });

      test("a month in the past", () {
        final now = kMockThen.add(Duration(days: 32));
        final timeAgo = TimeAgo(kMockThen, now: now);

        expect(timeAgo.format(), "1 month ago");
      });

      test("some months in the past", () {
        final now = kMockThen.add(Duration(days: 64));
        final timeAgo = TimeAgo(kMockThen, now: now);

        expect(timeAgo.format(), "2 months ago");
      });

      test("some years in the past", () {
        final now = kMockThen.add(Duration(days: 732));
        final timeAgo = TimeAgo(kMockThen, now: now);

        expect(timeAgo.format(), "2 years ago");
      });
    });

    group(".toString", () {

      test("should match format", () {
        final now = kMockThen.add(Duration(days: 732));
        final timeAgo = TimeAgo(kMockThen, now: now);

        expect(timeAgo.format(), "2 years ago");
        expect(timeAgo.toString(), "2 years ago");
      });
    });
  });
}
