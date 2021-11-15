import 'package:http/http.dart';
import 'package:twitter_client/src/api.dart';

class Statuses {
  final TwitterAPI twitter;

  Statuses(this.twitter);

  /// Returns a collection of the most recent Tweets and Retweets posted by the authenticating user and the users they follow.
  /// The home timeline is central to how most users interact with the Twitter service.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/api-reference/get-statuses-home_timeline
  Future<void> homeTimeline({
    int? count,
    int? sinceID,
    int? maxID,
    bool? trimUser,
    bool? excludeReplies,
    bool? includeEntities
  }) async {
    Map<String, String> params = twitter.validateParams({
      'count': count?.toString(),
      'since_id': sinceID?.toString(),
      'max_id': maxID?.toString(),
      'trim_user': trimUser?.toString(),
      'exclude_replies': excludeReplies?.toString(),
      'include_entities': includeEntities?.toString(),
    });

    Response response = await twitter.get("/1.1/statuses/home_timeline.json", params: params);
  }

  /// Returns the 20 most recent mentions (Tweets containing a users's @screen_name) for the authenticating user.
  /// The timeline returned is the equivalent of the one seen when you view your mentions on twitter.com.
  /// This method can only return up to 800 tweets.
  Future<void> mentionsTimeline() async {

  }

  /// Returns a collection of the most recent Tweets posted by the user indicated by the screen_name or user_id parameters.
  Future<void> userTimeline() async {

  }

  /// Updates the authenticating user's current status, also known as Tweeting.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-update
  Future<void> update() async {

  }

  /// Destroys the status specified by the required ID parameter.
  /// The authenticating user must be the author of the specified status.
  /// Returns the destroyed status if successful.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-destroy-id
  Future<void> destroy(String id) async {

  }

  /// Returns a single Tweet, specified by the id parameter. The Tweet's author will also be embedded within the Tweet.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-show-id
  Future<void> show(String id) async {

  }

  /// Returns fully-hydrated Tweet objects for up to 100 Tweets per request, as specified by comma-separated values passed to the id parameter.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-lookup
  Future<void> lookup() async {

  }

  /// Retweets a tweet.
  /// Returns the original Tweet with Retweet details embedded.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-retweet-id
  Future<void> retweet(String id) async {

  }

  /// Untweets a retweeted status.
  /// Returns the original Tweet with Retweet details embedded.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-unretweet-id
  Future<void> unretweet(String id) async {

  }

  /// Returns a collection of the 100 most recent retweets of the Tweet specified by the [id] parameter.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweets-id
  Future<void> retweets(String id) async {

  }

  /// Returns the most recent Tweets authored by the authenticating user that have been retweeted by others.
  /// This timeline is a subset of the user's GET statuses/user_timeline.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweets_of_me
  Future<void> retweetsOfMe() async {

  }

  /// Returns a collection of up to 100 user IDs belonging to users who have retweeted the Tweet specified by the id parameter.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweeters-ids
  Future<void> retweeters(String id) async {

  }
}