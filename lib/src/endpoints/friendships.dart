import 'package:http/http.dart';
import 'package:twitter_client/src/api.dart';

class Friendships {
  final TwitterAPI twitter;

  Friendships(this.twitter);

  /// Returns a collection of numeric IDs for every user who has a pending request to follow the authenticating user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-incoming
  Future<void> incoming({
    /// Causes the list of connections to be broken into pages of no more than 5000 IDs at a time.
    int? cursor,

    /// Provide this option to have ids returned as strings instead.
    bool? stringifyIDs
  }) async {
    Map<String, String> params = twitter.createParams({
      'cursor': cursor,
      'stringify_ids': stringifyIDs,
    });

    Response response = await twitter.get("/1.1/friendships/incoming.json", params: params);
  }

  /// Returns the relationships of the authenticating user to the comma-separated list of up to 100 screen_names or user_ids provided.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-lookup
  Future<void> lookup({
    /// A comma separated list of screen names, up to 100 are allowed in a single request.
    List<String>? screenName,

    /// A comma separated list of user IDs, up to 100 are allowed in a single request.
    List<int>? userID,
  }) async {
    Map<String, String> params = twitter.createParams({
      'screen_name': screenName,
      'user_id': userID,
    });

    Response response = await twitter.get("/1.1/friendships/lookup.json", params: params);
  }

  /// Returns a collection of user_ids that the currently authenticated user does not want to receive retweets from.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-no_retweets-ids
  Future<void> noRetweetsIDs({
    /// Provide this option to have IDs returned as strings instead.
    String? stringifyIDs,
  }) async {
    Map<String, String> params = twitter.createParams({
      'stringify_ids': stringifyIDs,
    });

    Response response = await twitter.get("/1.1/friendships/no_retweets/ids.json", params: params);
  }

  /// Returns a collection of numeric IDs for every protected user for whom the authenticating user has a pending follow request.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-outgoing
  Future<void> outgoing({
    /// Causes the list of connections to be broken into pages of no more than 5000 IDs at a time.
    int? cursor,

    /// Provide this option to have ids returned as strings instead.
    bool? stringifyIDs
  }) async {
    Map<String, String> params = twitter.createParams({
      'cursor': cursor,
      'stringify_ids': stringifyIDs,
    });

    Response response = await twitter.get("/1.1/friendships/outgoing.json", params: params);
  }

  /// Returns detailed information about the relationship between two arbitrary users.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-show
  Future<void> show({
    /// The user_id of the subject user.
    int? sourceID,

    /// The screen_name of the subject user.
    String? sourceScreenName,

    /// The user_id of the target user.	
    int? targetID,

    /// The screen_name of the target user.
    String? targetScreenName,
  }) async {
    Map<String, String> params = twitter.createParams({
      'source_id': sourceID,
      'source_screen_name': sourceScreenName,
      'target_id': targetID,
      'target_screen_name': targetScreenName,
    });

    Response response = await twitter.get("/1.1/friendships/show.json", params: params);
  }

  /// Allows the authenticating user to follow (friend) the user specified in the ID parameter.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/post-friendships-create
  Future<void> create({
    /// The screen name of the user to follow.
    String? screenName,

    /// The ID of the user to follow.
    int? userID,

    /// Enable notifications for the target user.
    bool? follow,
  }) async {
    Map<String, String> params = twitter.createParams({
      'screen_name': screenName,
      'user_id': userID,
      'follow': follow,
    });

    Response response = await twitter.get("/1.1/friendships/create.json", params: params);
  }

  /// Allows the authenticating user to unfollow the user specified in the ID parameter.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/post-friendships-destroy
  Future<void> destroy({
    /// The screen name of the user to unfollow.	
    String? screenName,

    /// The ID of the user to unfollow.
    int? userID,
  }) async {
    Map<String, String> params = twitter.createParams({
      'screen_name': screenName,
      'user_id': userID,
    });

    Response response = await twitter.get("/1.1/friendships/destroy.json", params: params);
  }

  /// Turn on/off Retweets and device notifications from the specified user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/post-friendships-update
  Future<void> update({
    /// The screen name of the user being followed.
    String? screenName,

    /// The ID of the user being followed.
    int? userID,

    /// Turn on/off device notifications from the target user.
    bool? device,

    /// Turn on/off Retweets from the target user.
    bool? retweets,
  }) async {
    Map<String, String> params = twitter.createParams({
      'screen_name': screenName,
      'user_id': userID,
      'device': device,
      'retweets': retweets,
    });

    Response response = await twitter.get("/1.1/friendships/update.json", params: params);
  }
}