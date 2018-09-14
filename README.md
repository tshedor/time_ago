# TimeAgo

Timestamps for humans: `59 seconds ago` `2 weeks ago` `1 hour ago` `Yesterday`.

## Getting Started

Import the library:

```dart
import 'package:time_ago/time_ago.dart';
```

## Usage

```dart
import 'package:time_ago/time_ago.dart';

final last_seen = TimeAgo(user.lastSignedInAt);

new Text(last_seen)
```

Not doing it for you? What if I told you you could *manipulate time*:

```dart
final last_seen = TimeAgo(user.lastSignedInAt, now: DateTime(1938, 10, 30, 20, 0, 0));

new Text(last_seen)
```

Other methods/getters are available too:

```dart
final last_seen = TimeAgo(user.lastSignedInAt);

last_seen.inSeconds
last_seen.inMinutes
last_seen.inHours
last_seen.inDays // in one specific case this will return "Yesterday"
last_seen.inWeeks
last_seen.inMonths
last_seen.inYears
last_seen.format() // Chooses and displays one of the above
```

## Internationalization

Pull requests welcome.

## Thanks

Props to [AllGo](https://www.canweallgo.com/) for providing the initial support for this project.
