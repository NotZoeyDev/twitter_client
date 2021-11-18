class Retweeters {
  int? previousCursor;
  String? previousCursorStr;
  int? nextCursor;
  String? nextCursorStr;

  List<dynamic>? ids;

  Retweeters({this.previousCursor, this.previousCursorStr, this.nextCursor, this.nextCursorStr, this.ids});

  factory Retweeters.fromJson(Map<String, dynamic> json) => Retweeters(
    previousCursor: json['previous_cursor'],
    previousCursorStr: json['previous_cursor_str'],
    nextCursor: json['next_cursor'],
    nextCursorStr: json['next_cursor_str'],
    ids: json['ids'],
  );
}