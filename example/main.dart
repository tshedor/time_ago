import 'package:time_ago/time_ago.dart';

main() async {
  final now = DateTime.now();
  final comment_date = now.subtract(Duration(days: 2));
  final commented = TimeAgo(comment_date);

  print(commented); // => "Two days ago"
  print(commented.inHours); //=> "48 hours ago"
}
