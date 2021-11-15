import 'package:twitter_client/src/api.dart';
import 'package:twitter_client/src/endpoints/account.dart';
import 'package:twitter_client/src/endpoints/blocks.dart';
import 'package:twitter_client/src/endpoints/collections.dart';
import 'package:twitter_client/src/endpoints/custom_profiles.dart';
import 'package:twitter_client/src/endpoints/direct_messages.dart';
import 'package:twitter_client/src/endpoints/favorites.dart';
import 'package:twitter_client/src/endpoints/feedback.dart';
import 'package:twitter_client/src/endpoints/followers.dart';
import 'package:twitter_client/src/endpoints/friends.dart';
import 'package:twitter_client/src/endpoints/friendships.dart';
import 'package:twitter_client/src/endpoints/geo.dart';
import 'package:twitter_client/src/endpoints/lists.dart';
import 'package:twitter_client/src/endpoints/media.dart';
import 'package:twitter_client/src/endpoints/mutes.dart';
import 'package:twitter_client/src/endpoints/oauth.dart';
import 'package:twitter_client/src/endpoints/saved_searches.dart';
import 'package:twitter_client/src/endpoints/statuses.dart';
import 'package:twitter_client/src/endpoints/trends.dart';
import 'package:twitter_client/src/endpoints/users.dart';

class TwitterClient {
  late final TwitterAPI twitter;

  late Account account;
  late Blocks blocks;
  late Collections collections;
  late CustomProfiles customProfiles;
  late DirectMessages directMessages;
  late Favorites favorites;
  late Feedback feedback;
  late Followers followers;
  late Friends friends;
  late Friendships friendships;
  late Geo geo;
  late Lists lists;
  late Media media;
  late Mutes mutes;
  late OAuth oAuth;
  late SavedSearches savedSearches;
  late Statuses statuses;
  late Trends trends;
  late Users users;

  TwitterClient({
    required String consumerKey,
    required String consumerSecret,
    String token = "",
    String tokenSecret = "",
  }) {
    this.twitter = new TwitterAPI(
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      token: token,
      tokenSecret: tokenSecret
    );

    this.account = new Account(twitter);
    this.blocks = new Blocks(twitter);
    this.collections = new Collections(twitter);
    this.customProfiles = new CustomProfiles(twitter);
    this.directMessages = new DirectMessages(twitter);
    this.favorites = new Favorites(twitter);
    this.feedback = new Feedback(twitter);
    this.followers = new Followers(twitter);
    this.friends = new Friends(twitter);
    this.friendships = new Friendships(twitter);
    this.geo = new Geo(twitter);
    this.lists = new Lists(twitter);
    this.media = new Media(twitter);
    this.mutes = new Mutes(twitter);
    this.oAuth = new OAuth(twitter);
    this.savedSearches = new SavedSearches(twitter);
    this.statuses = new Statuses(twitter);
    this.trends = new Trends(twitter);
    this.users = new Users(twitter);
  }
}