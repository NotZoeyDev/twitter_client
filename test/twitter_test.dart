import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:twitter_client/twitter.dart';

void main() {
  final String infoFile = File("./test/info.json").readAsStringSync();
  final Map<String, dynamic> info = jsonDecode(infoFile);

  final String consumerKey = info['consumer_key'] ?? "";
  final String consumerSecret = info['consumer_secret'] ?? "";
  final String username = info['username'] ?? "";
  final String password = info['password'] ?? "";

  TwitterClient client = new TwitterClient(
    consumerKey: consumerKey,
    consumerSecret: consumerSecret,
  );

  test('Login via xAuth', () async {
    var accessToken = await client.oAuth.accessTokenViaXauth(username, password);
    client = new TwitterClient(
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      token: accessToken.token,
      tokenSecret: accessToken.tokenSecret
    );
  });

  const String tweetText = "Test tweet, please ignore";
  int tweetID = 0;

  test('Post a Tweet', () async {
    var tweet = await client.statuses.update(tweetText);
    expect(tweet.text, tweetText);
    tweetID = tweet.id;
  });

  test('Fetch a Tweet', () async {
    var tweet = await client.statuses.show(tweetID);
    expect(tweet.text, tweetText);
  });

  test('Delete a Tweet', () async {
    await client.statuses.destroy(tweetID);
  });

  int imageTweetID = 0;

  test('Upload an image', () async {
    var bytes = await File("./test/test.jpg").readAsBytes();

    var media = await client.media.upload(
      mediaData: base64Encode(bytes)
    );

    var tweet = await client.statuses.update("Test image, please ignore", mediaIDs: [media.mediaID!]);
    imageTweetID = tweet.id;
  });

  test('Delete uploaded image', () async {
    await client.statuses.destroy(imageTweetID);
  });
}