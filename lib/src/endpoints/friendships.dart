import 'package:twitter_client/src/api.dart';

class Friendships {
  final TwitterAPI twitter;

  Friendships(this.twitter);

  /// Returns a collection of numeric IDs for every user who has a pending request to follow the authenticating user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-incoming
  Future<void> incoming() async {

  }

  /// Returns the relationships of the authenticating user to the comma-separated list of up to 100 screen_names or user_ids provided.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-lookup
  Future<void> lookup() async {

  }

  /// Returns a collection of user_ids that the currently authenticated user does not want to receive retweets from.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-no_retweets-ids
  Future<void> noRetweetsIDs() async {

  }

  /// Returns a collection of numeric IDs for every protected user for whom the authenticating user has a pending follow request.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-outgoing
  Future<void> outgoing() async {

  }

  /// Returns detailed information about the relationship between two arbitrary users.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-show
  Future<void> show() async {

  }

  /// Allows the authenticating user to follow (friend) the user specified in the ID parameter.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/post-friendships-create
  Future<void> create() async {

  }

  /// Allows the authenticating user to unfollow the user specified in the ID parameter.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/post-friendships-destroy
  Future<void> destroy() async {

  }

  /// Turn on/off Retweets and device notifications from the specified user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/post-friendships-update
  Future<void> update() async {

  }
}