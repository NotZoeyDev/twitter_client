import 'package:http/http.dart';
import 'package:twitter_client/api.dart';
import 'package:twitter_client/client.dart';
import 'package:twitter_client/models/Tweet.dart';

void main() async {
  TwitterAPI twitter = new TwitterAPI(
    consumerKey: "",
    consumerSecret: "",
    token: "",
    tokenSecret: ""
  );

  TwitterClient client = new TwitterClient(twitter);

  client.sendTweet("Something something test").then((Tweet tweet) {
    print(tweet.user.profileBannerUrl);
  });
}