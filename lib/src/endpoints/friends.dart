import 'package:http/http.dart';
import 'package:twitter_client/src/api.dart';

class Friends {
  final TwitterAPI twitter;

  Friends(this.twitter);

  /// Returns a cursored collection of user IDs for every user the specified user is following (otherwise known as their "friends").
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friends-ids
  Future<void> ids({
    /// The ID of the user for whom to return results.
    int? userID,

    /// The screen name of the user for whom to return results.
    String? screenName,

    /// Causes the list of connections to be broken into pages of no more than 5000 IDs at a time.
    int? cursor,

    /// Provide this option to have IDs returned as strings instead.
    bool? stringifyIDs,

    /// Specifies the number of IDs attempt retrieval of, up to a maximum of 5,000 per distinct request.
    int? count,
  }) async {
    Map<String, String> params = twitter.createParams({
      'user_id': userID,
      'screen_name': screenName,
      'cursor': cursor,
      'count': count,
    });

    Response response = await twitter.get("/1.1/friends/ids.json", params: params);
  }

  /// Returns a cursored collection of user objects for every user the specified user is following (otherwise known as their "friends").
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friends-list
  Future<void> list({
    /// The ID of the user for whom to return results.
    int? userID,

    /// The screen name of the user for whom to return results.
    String? screenName,

    /// Causes the results to be broken into pages.
    int? cursor,

    /// The number of users to return per page, up to a maximum of 200.
    int? count,

    /// When set to either true, t or 1 statuses will not be included in the returned user objects.
    bool? skipStatus,

    /// The user object entities node will not be included when set to false.
    bool? includeUserEntities,
  }) async {
    Map<String, String> params = twitter.createParams({
      'user_id': userID,
      'screen_name': screenName,
      'cursor': cursor,
      'count': count,
      'skip_status': skipStatus,
      'include_user_entites': includeUserEntities,
    });

    Response response = await twitter.get("/1.1/friends/list.json", params: params);
  }
}