import 'dart:convert';

import 'package:http/http.dart';
import 'package:twitter_client/src/endpoints/oauth.dart';
import 'package:twitter_client/twitter.dart';

/// Wrapper class used to simplify requests to Twitter's API
class TwitterClient {
  TwitterAPI twitter;

  late OAuth oAuth;

  TwitterClient(this.twitter) {
    this.oAuth = new OAuth(this.twitter);
  }

  /// Get the list of followers of someone
  Future<String> getFollowersList() async {
    Response response = await twitter.get("/1.1/followers/list.json", params: {
      "screen_name": "CStar_OW",
      "cursor": "-1"
    });

    if (response.statusCode != 200) throw("Tweet couldn't be sent.");

    print("nice");

    return "bruh";
  }

  /// Send a Tweet to Twitter
  /// [tweet] is the content of your Tweet
  /// [reply_to] is the ID of the tweet to reply to
  /// [media_ids] is a list of IDs of images you've uploaded to Twitter
  Future<Tweet> sendTweet(String tweet, {String? replyTo, List<String>? mediaIDs}) async {
    Map<String, String> params = {
      "status": tweet
    };

    // Tweet ID that we're replying to
    if (replyTo != null) {
      params.addAll({
        "auto_populate_reply_metadata": "true",
        "in_reply_to_status_id": replyTo
      });
    }

    // List of Medias we're uploading alongside the picture
    if (mediaIDs != null) {
      params.addAll({
        "media_ids": mediaIDs.join(',')
      });
    }

    Response response = await twitter.post("/1.1/statuses/update.json", params: params);

    if (response.statusCode != 200) throw("Tweet couldn't be sent.");

    return new Tweet.fromJson(jsonDecode(response.body));
  }

  /// Get home timeline
  Future<void> getHomeTimeline({
    int count = 40,
    String? sinceID
  }) async {
    Map<String, String> params = {
      "count": "$count",
      "include_my_retweet": "true",
      "cards_platform": "web",
      "include_entities": "true",
      "include_user_entities": "true",
      "include_cards": "true",
      "send_error_codes": "true",
      "tweet_mode": "extended",
      "include_ext_alt_text": "true",
      "include_reply_count": "true"
    };

    if (sinceID != null) {
      params.addAll({
        "since_id": "$sinceID"
      });
    }

    Response response = await twitter.get("/1.1/statuses/home_timeline.json", params: params);

    if (response.statusCode != 200) {
      throw "Couldn't fetch home timeline!";
    }

    print(json.decode(response.body));
  }

  /// Read a conversation
  /// [tweetID] is the tweet ID of the conversation you wanna fetch
  Future<List<Tweet>> getConversation(String tweetID) async {
    Response response = await twitter.get("/2/timeline/conversation/$tweetID.json", params: {
      "include_reply_count": "true",
      "cards_platform": "Web-13",
      "include_entities": "true",
      "include_user_entities": "true",
      "include_cards": "true",
      "tweet_mode": "extended",
      "include_ext_alt_text": "true"
    });

    Map<String, dynamic> body = json.decode(response.body);

    Map<String, dynamic> tweets = body["globalObjects"]["tweets"];

    return tweets.entries.map((tweet) => Tweet.fromJson(tweet.value)).toList();
  }
}