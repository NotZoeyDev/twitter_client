import 'dart:convert';

import 'package:http/http.dart';
import 'package:twitter_client/src/api.dart';
import 'package:twitter_client/src/responses/activity.dart';

class Activity {
  TwitterAPI twitter;

  Activity(this.twitter);

  /// This is an undocumented Twitter API, use at your own risk!
  Future<List<AboutMe>> aboutMe({
    int? sinceID,
    int? count,
    bool? skipAggregation,
    bool? includeEntities,
    bool? includeUserEntities,
    bool? sendErrorCodes,
    String? tweetMode,
    bool? includeExtAltText,
    bool? includeReplyCount,
    bool? includeExtMediacolor,
  }) async {
    Map<String, String> params = twitter.createParams({
      'since_id': sinceID,
      'count': count,
      'skip_aggregation': skipAggregation,
      'include_entites': includeEntities,
      'include_user_entites': includeUserEntities,
      'send_error_codes': sendErrorCodes,
      'tweet_mode': tweetMode,
      'include_ext_alt_text': includeExtAltText,
      'include_reply_count': includeReplyCount,
      'include_ext_media_color': includeExtMediacolor,
    });

    Response response = await twitter.get("/1.1/activity/about_me.json", params: params);
    if (response.statusCode != 200) {
      throw "error getting activity";
    }

    return jsonDecode(response.body).map((action) => AboutMe.fromJson(action)).toList().cast<AboutMe>();
  }

}