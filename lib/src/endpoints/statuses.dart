import 'dart:convert';

import 'package:http/http.dart';
import 'package:twitter_client/src/api.dart';
import 'package:twitter_client/src/objects/tweet.dart';

class Statuses {
  final TwitterAPI twitter;

  Statuses(this.twitter);

  /// Returns a collection of the most recent Tweets and Retweets posted by the authenticating user and the users they follow.
  /// The home timeline is central to how most users interact with the Twitter service.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/api-reference/get-statuses-home_timeline
  Future<void> homeTimeline({
    /// Specifies the number of records to retrieve.
    int? count,

    /// Returns results with an ID greater than (that is, more recent than) the specified ID. 
    int? sinceID,

    /// Returns results with an ID less than (that is, older than) or equal to the specified ID.
    int? maxID,

    /// When set to either true, t or 1, each Tweet returned in a timeline will include a user object including only the status authors numerical ID.
    bool? trimUser,

    /// This parameter will prevent replies from appearing in the returned timeline.
    bool? excludeReplies,

    /// The entities node will not be included when set to false.
    bool? includeEntities
  }) async {
    Map<String, String> params = twitter.createParams({
      'count': count,
      'since_id': sinceID,
      'max_id': maxID,
      'trim_user': trimUser,
      'exclude_replies': excludeReplies,
      'include_entities': includeEntities,
    });

    Response response = await twitter.get("/1.1/statuses/home_timeline.json", params: params);
  }

  /// Returns the 20 most recent mentions (Tweets containing a users's @screen_name) for the authenticating user.
  /// The timeline returned is the equivalent of the one seen when you view your mentions on twitter.com.
  /// This method can only return up to 800 tweets.
  Future<void> mentionsTimeline({
    /// Specifies the number of records to retrieve.
    int? count,

    /// Returns results with an ID greater than (that is, more recent than) the specified ID. 
    int? sinceID,

    /// Returns results with an ID less than (that is, older than) or equal to the specified ID.
    int? maxID,

    /// When set to either true, t or 1, each Tweet returned in a timeline will include a user object including only the status authors numerical ID.
    bool? trimUser,

    /// The entities node will not be included when set to false.
    bool? includeEntities
  }) async {
    Map<String, String> params = twitter.createParams({
      'count': count,
      'since_id': sinceID,
      'max_id': maxID,
      'trim_user': trimUser,
      'include_entities': includeEntities,
    });

    Response response = await twitter.get("/1.1/statuses/mentions_timeline.json", params: params);
  }

  /// Returns a collection of the most recent Tweets posted by the user indicated by the screen_name or user_id parameters.
  Future<void> userTimeline({
    /// The ID of the user for whom to return results.
    int? userID,

    /// The screen name of the user for whom to return results.   
    String? screenName,

    /// Specifies the number of records to retrieve.
    int? count,

    /// Returns results with an ID greater than (that is, more recent than) the specified ID. 
    int? sinceID,

    /// Returns results with an ID less than (that is, older than) or equal to the specified ID.
    int? maxID,

    /// When set to either true, t or 1, each Tweet returned in a timeline will include a user object including only the status authors numerical ID.
    bool? trimUser,

    /// This parameter will prevent replies from appearing in the returned timeline.
    bool? excludeReplies,

    /// When set to false, the timeline will strip any native retweets (though they will still count toward both the maximal length of the timeline and the slice selected by the count parameter).
    bool? includeRTs
  }) async {
    Map<String, String> params = twitter.createParams({
      'user_id': userID,
      'screen_name': screenName,
      'count': count,
      'since_id': sinceID,
      'max_id': maxID,
      'trim_user': trimUser,
      'exclude_replies': excludeReplies,
      'include_rts': includeRTs,
    });

    Response response = await twitter.get("/1.1/statuses/user_timeline.json", params: params);
  }

  /// Updates the authenticating user's current status, also known as Tweeting.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-update
  Future<Tweet> update(
    /// The text of the status update.
    String status,
    {
      /// The ID of an existing status that the update is in reply to.
      int? inReplyToStatusID,

      /// If set to true and used with in_reply_to_status_id, leading @mentions will be looked up from the original Tweet, and added to the new Tweet from there.
      bool? autoPopulateReplyMetadata,

      /// When used with auto_populate_reply_metadata, a comma-separated list of user ids which will be removed from the server-generated @mentions prefix on an extended Tweet.
      List<int>? excludeReplyUserIDs,

      /// In order for a URL to not be counted in the status body of an extended Tweet, provide a URL as a Tweet attachment.
      String? attachmentURL,

      /// A comma-delimited list of media_ids to associate with the Tweet.
      List<int>? mediaIDs,

      /// If you upload Tweet media that might be considered sensitive content such as nudity, or medical procedures, you must set this value to true.
      bool? possiblySensitive,

      /// The latitude of the location this Tweet refers to.
      double? lat,

      /// The longitude of the location this Tweet refers to.
      double? long,

      /// A place in the world.
      int? placeID,

      /// Whether or not to put a pin on the exact coordinates a Tweet has been sent from.
      bool? displayCoordinates,

      /// When set to either true, t or 1, the response will include a user object including only the author's ID.
      bool? trimUser,

      /// When set to true, enables shortcode commands for sending Direct Messages as part of the status text to send a Direct Message to a user.
      bool? enableDMCommands,

      /// When set to true, causes any status text that starts with shortcode commands to return an API error.
      bool? failDMCommands,

      /// Associate an ads card with the Tweet using the card_uri value from any ads card response.
      String? cardURI,
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'status': status,
      'in_reply_to_status_id': inReplyToStatusID,
      'auto_populate_reply_metadata': autoPopulateReplyMetadata,
      'exclude_reply_user_ids': excludeReplyUserIDs?.join(','),
      'attachment_url': attachmentURL,
      'media_ids': mediaIDs?.join(','),
      'possibly_sensitive': possiblySensitive,
      'lat': lat,
      'long': long,
      'place_id': placeID,
      'display_coordinates': displayCoordinates,
      'trim_user': trimUser,
      'enable_dmcommands': enableDMCommands,
      'fail_dmcommands': failDMCommands,
      'card_uri': cardURI,
    });

    Response response = await twitter.post("/1.1/statuses/update.json", params: params);
    if (response.statusCode != 200) {
      throw "Error updating status";
    }

    return Tweet.fromJson(jsonDecode(response.body));
  }

  /// Destroys the status specified by the required ID parameter.
  /// The authenticating user must be the author of the specified status.
  /// Returns the destroyed status if successful.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-destroy-id
  Future<void> destroy(
    /// The numerical ID of the desired status.
    int id,
    {
      /// When set to either true, t or 1, each tweet returned in a timeline will include a user object including only the status authors numerical ID.
      bool? trimUser,
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'trim_user': trimUser,
    });

    Response response = await twitter.post("/1.1/statuses/destroy/$id.json", params: params);
  }

  /// Returns a single Tweet, specified by the id parameter. The Tweet's author will also be embedded within the Tweet.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-show-id
  Future<Tweet> show(
    /// The numerical ID of the desired Tweet.
    int id,
    {
      /// When set to either true, t or 1, each Tweet returned in a timeline will include a user object including only the status authors numerical ID.
      bool? trimUser,

      /// When set to either true , t or 1 , any Tweets returned that have been retweeted by the authenticating user will include an additional current_user_retweet node, containing the ID of the source status for the retweet.
      bool? includeMyRetweet,

      /// The entities node will not be included when set to false.
      bool? includeEntities,

      /// If alt text has been added to any attached media entities, this parameter will return an ext_alt_text value in the top-level key for the media entity.
      bool? includeExtAltText,

      /// When set to either true, t or 1, the retrieved Tweet will include a card_uri attribute when there is an ads card attached to the Tweet and when that card was attached using the card_uri value.
      bool? includeCardURI,
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'id': id,
      'trim_user': trimUser,
      'include_my_retweet': includeMyRetweet,
      'include_entities': includeEntities,
      'include_ext_alt_text': includeExtAltText,
      'include_card_uri': includeCardURI,
    });

    Response response = await twitter.get("/1.1/statuses/show.json", params: params);
    if (response.statusCode != 200) {
      throw "Error looking up status";
    }

    return Tweet.fromJson(jsonDecode(response.body)); 
  }

  /// Returns fully-hydrated Tweet objects for up to 100 Tweets per request, as specified by comma-separated values passed to the id parameter.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-lookup
  Future<Tweet> lookup(
    /// The numerical ID of the desired Tweet.
    int id,
    {
      /// The entities node will not be included when set to false.
      bool? includeEntities,

      /// When set to either true, t or 1, each Tweet returned in a timeline will include a user object including only the status authors numerical ID.
      bool? trimUser,

      /// When using the map parameter, Tweets that do not exist or cannot be viewed by the current user will still have their key represented but with an explicitly null value paired with it.
      bool? map,

      /// If alt text has been added to any attached media entities, this parameter will return an ext_alt_text value in the top-level key for the media entity.
      bool? includeExtAltText,

      /// When set to either true, t or 1, the retrieved Tweet will include a card_uri attribute when there is an ads card attached to the Tweet and when that card was attached using the card_uri value.
      bool? includeCardURI,
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'id': id,
      'include_entities': includeEntities,
      'trim_user': trimUser,
      'map': map,
      'include_ext_alt_text': includeExtAltText,
      'include_card_uri': includeCardURI,
    });

    Response response = await twitter.get("/1.1/statuses/lookup.json", params: params);
    if (response.statusCode != 200) {
      throw "Error looking up status";
    }

    return Tweet.fromJson(jsonDecode(response.body));
  }

  /// Retweets a tweet.
  /// Returns the original Tweet with Retweet details embedded.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-retweet-id
  Future<void> retweet(
    /// The numerical ID of the desired status.
    String id,
    {
      /// When set to either true, t or 1, each tweet returned in a timeline will include a user object including only the status authors numerical ID.
      bool? trimUser,
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'trim_user': trimUser,
    });

    Response response = await twitter.post("/1.1/statuses/retweet/$id.json", params: params);
  }

  /// Untweets a retweeted status.
  /// Returns the original Tweet with Retweet details embedded.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-unretweet-id
  Future<void> unretweet(
    /// The numerical ID of the desired status.
    String id,
    {
      /// When set to either true, t or 1, each tweet returned in a timeline will include a user object including only the status authors numerical ID.
      bool? trimUser,
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'trim_user': trimUser,
    });

    Response response = await twitter.post("/1.1/statuses/unretweet/$id.json", params: params);
  }

  /// Returns a collection of the 100 most recent retweets of the Tweet specified by the [id] parameter.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweets-id
  Future<void> retweets(
    /// The numerical ID of the desired status.
    String id,
    {
      /// Specifies the number of records to retrieve.
      int? count,

      /// When set to either true, t or 1, each tweet returned in a timeline will include a user object including only the status authors numerical ID.
      bool? trimUser,
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'count': count,
      'trim_user': trimUser,
    });

    Response response = await twitter.post("/1.1/statuses/retweets/$id.json", params: params);
  }

  /// Returns the most recent Tweets authored by the authenticating user that have been retweeted by others.
  /// This timeline is a subset of the user's GET statuses/user_timeline.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweets_of_me
  Future<void> retweetsOfMe({
    /// Specifies the number of records to retrieve.
    int? count,

    /// Returns results with an ID greater than (that is, more recent than) the specified ID.
    int? sinceID,

    /// Returns results with an ID less than (that is, older than) or equal to the specified ID.
    int? maxID,

    /// When set to either true, t or 1, each tweet returned in a timeline will include a user object including only the status authors numerical ID.
    bool? trimUser,

    /// The tweet entities node will not be included when set to false.
    bool? includeEntities,

    /// The user entities node will not be included when set to false.
    bool? includeUserEntities,
  }) async {
    Map<String, String> params = twitter.createParams({
      'count': count,
      'since_id': sinceID,
      'max_id': maxID,
      'trim_user': trimUser,
      'include_entities': includeEntities,
      'include_user_entities': includeUserEntities,
    });

    Response response = await twitter.post("/1.1/statuses/retweets_of_me.json", params: params);
  }

  /// Returns a collection of up to 100 user IDs belonging to users who have retweeted the Tweet specified by the id parameter.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweeters-ids
  Future<void> retweeters(
    /// The numerical ID of the desired status.
    String id,
    {
      /// Specifies the number of records to retrieve. Must be less than or equal to 100.
      int? count,

      /// Causes the list of IDs to be broken into pages of no more than 100 IDs at a time. The number of IDs returned is not guaranteed to be 100 as suspended users are filtered out after connections are queried. If no cursor is provided, a value of -1 will be assumed, which is the first "page."
      int? cursor,

      /// Many programming environments will not consume Tweet ids due to their size.
      bool? stringifyIDs,
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'count': count,
      'cursor': cursor,
      'stringify_ids': stringifyIDs,
    });

    Response response = await twitter.post("/1.1/statuses/retweets_of_me.json", params: params);
  }
}