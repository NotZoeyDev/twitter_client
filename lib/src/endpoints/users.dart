import 'dart:convert';

import 'package:http/http.dart';
import 'package:twitter_client/src/api.dart';
import 'package:twitter_client/src/objects/user.dart';

class Users {
  final TwitterAPI twitter;

  Users(this.twitter);

  /// Returns fully-hydrated user objects for up to 100 users per request, as specified by comma-separated values passed to the user_id and/or screen_name parameters.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-lookup
  Future<void> lookup({
    /// A comma separated list of screen names, up to 100 are allowed in a single request.
    List<String>? screenName,

    /// A comma separated list of user IDs, up to 100 are allowed in a single request.
    List<int>? userID,

    /// The entities node that may appear within embedded statuses will not be included when set to false.
    bool? includeEntities,

    /// Valid request values are compat and extended, which give compatibility mode and extended mode, respectively for Tweets that contain over 140 characters.
    bool? tweetMode,
  }) async {
    Map<String, String> params = twitter.createParams({
      'screen_name': screenName?.join(','),
      'user_id': userID?.join(','),
      'include_entities': includeEntities,
      'tweet_mode': tweetMode,
    });

    Response response;
    if (screenName != null && screenName.length > 50 || userID != null && userID.length > 50) {
      response = await twitter.post("/1.1/users/lookup.json", params: params);
    } else {
      response = await twitter.get("/1.1/users/lookup.json", params: params);
    }
  }

  /// Provides a simple, relevance-based search interface to public user accounts on Twitter.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-search
  Future<void> search(
    /// The search query to run against people search.
    String query,
    {
      /// Specifies the page of results to retrieve.
      int? page,

      /// The number of potential user results to retrieve per page.
      int? count,

      /// The entities node will not be included in embedded Tweet objects when set to false.
      bool? includeEntities,
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'q': query,
      'page': page,
      'count': count,
      'include_entities': includeEntities,
    });

    Response response = await twitter.get("/1.1/users/search.json", params: params);
  }

  /// Returns a variety of information about the user specified by the required user_id or screen_name parameter.
  /// The author's most recent Tweet will be returned inline when possible.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-show
  Future<User> show({
    /// The ID of the user for whom to return results.
    int? userID,

    /// The screen name of the user for whom to return results.
    String? screenName,

    /// The entities node will not be included when set to false.
    bool? includeEntities,
  }) async {
    if (userID == null && screenName == null) {
      throw "Either userID or screenName should be defined for this request.";
    }

    if (userID != null && screenName != null) {
      throw "Both userID or screenName can't be defined for this request.";
    }

    Map<String, String> params = twitter.createParams({
      'user_id': userID,
      'screen_name': screenName,
      'include_entities': includeEntities,
    });

    Response response = await twitter.get("/1.1/users/show.json", params: params);
    if (response.statusCode != 200) {
      throw "error showing user";
    }

    return User.fromJson(jsonDecode(response.body));
  }

  /// Report the specified user as a spam account to Twitter.
  /// Additionally, optionally performs the equivalent of POST blocks/create on behalf of the authenticated user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-users-report_spam
  Future<void> reportSpam({
    /// The screen_name of the user to report as a spammer.
    String? screenName,

    /// The ID of the user to report as a spammer.
    int? userID,

    /// Whether the account should be blocked by the authenticated user, as well as being reported for spam.
    bool? performBlock,
  }) async {
    Map<String, String> params = twitter.createParams({
      'user_id': userID,
      'screenName': screenName,
      'perform_block': performBlock,
    });

    Response response = await twitter.post("/1.1/users/report_spam.json", params: params);
  }

  /// Returns a map of the available size variations of the specified user's profile banner.
  /// If the user has not uploaded a profile banner, a HTTP 404 will be served instead.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-users-profile_banner
  Future<void> profileBanner({
    /// The ID of the user for whom to return results.
    int? userID,

    /// The screen name of the user for whom to return results.
    String? screenName,
  }) async {
    Map<String, String> params = twitter.createParams({
      'user_id': userID,
      'screen_name': screenName,
    });

    Response response = await twitter.get("/1.1/users/profile_banner.json", params: params);
  }
}