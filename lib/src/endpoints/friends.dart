import 'package:twitter_client/src/api.dart';

class Friends {
  final TwitterAPI twitter;

  Friends(this.twitter);

  /// Returns a cursored collection of user IDs for every user the specified user is following (otherwise known as their "friends").
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friends-ids
  Future<void> ids() async {

  }

  /// Returns a cursored collection of user objects for every user the specified user is following (otherwise known as their "friends").
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friends-list
  Future<void> list() async {

  }
}