import 'dart:convert';

import 'package:http/http.dart';
import 'package:twitter_client/api.dart';
import 'package:twitter_client/models/Tweet.dart';

class TwitterClient {
  TwitterAPI twitter;

  TwitterClient(this.twitter);

  /// Send a Tweet to Twitter
  /// [tweet] is the content of your Tweet
  /// [reply_to] is the ID of the tweet to reply to
  /// [media_ids] is a list of IDs of images you've uploaded to Twitter
  Future<Tweet> sendTweet(String tweet, {String replyTo, List<String> mediaIDs}) async {
    Map<String, String> params = {
      "status": tweet
    };

    if (replyTo != null) {
      params.addAll({
        "auto_populate_reply_metadata": "true",
        "in_reply_to_status_id": replyTo
      });
    }

    if (mediaIDs != null) {
      params.addAll({
        "media_ids": mediaIDs.join(',')
      });
    }

    Response response = await this.twitter.post("/1.1/statuses/update.json", params: params);

    if (response.statusCode != 200) {
      throw "Couldn't send this tweet!";
    }

    return new Tweet.fromJson(jsonDecode(response.body));
  }
}