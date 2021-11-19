import 'package:twitter_client/src/objects/tweet.dart';
import 'package:twitter_client/src/objects/user.dart';

class AboutMe {
  String action;
  String maxPosition;
  String minPosition;
  String createdAt;

  List<dynamic> targetObjects;
  int targetObjecsSize;

  List<Tweet> targets;
  int targetsSize;

  List<User> sources;
  int sourcesSize;

  AboutMe({
    required this.action,
    required this.maxPosition,
    required this.minPosition,
    required this.createdAt,
    required this.targetObjects,
    required this.targetObjecsSize,
    required this.targets,
    required this.targetsSize,
    required this.sources,
    required this.sourcesSize
  });

  factory AboutMe.fromJson(Map<String, dynamic> json) => AboutMe(
    action: json['action'],
    maxPosition: json['max_position'],
    minPosition: json['min_position'],
    createdAt: json['created_at'],

    targetObjects: json['target_objects'],
    targetObjecsSize: json['target_objects_size'],

    targets: json['targets'].map((tweet) => Tweet.fromJson(tweet)).toList().cast<Tweet>(),
    targetsSize: json['targets_size'],

    sources: json['sources'].map((user) => User.fromJson(user)).toList().cast<User>(),
    sourcesSize: json['sources_size'],
  );
}