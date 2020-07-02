import 'package:twitter_client/api.dart';
import 'package:twitter_client/client.dart';

void main() async {
  TwitterAPI twitter = new TwitterAPI(
    consumerKey: "",
    consumerSecret: "",
    token: "",
    tokenSecret: ""
  );

  TwitterClient client = new TwitterClient(twitter);

  client.getConversation("");
}