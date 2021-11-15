import 'package:twitter_client/src/api.dart';

class Followers {
  final TwitterAPI twitter;

  Followers(this.twitter);

  /// Returns a cursored collection of user IDs for every user following the specified user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-followers-ids
  Future<void> ids() async {

  }

  /// Returns a cursored collection of user objects for users following the specified user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-followers-list
  Future<void> list() async {

  }
}