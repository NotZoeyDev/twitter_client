import 'package:twitter_client/src/objects/entities.dart';

import 'coordinates.dart';
import 'place.dart';
import 'user.dart';

/// Tweet Object
/// 
/// https://developer.twitter.com/en/docs/twitter-api/v1/data-dictionary/object-model/tweet
class Tweet {
  /// UTC time when this Tweet was created.
  String createdAt;

  /// The integer representation of the unique identifier for this Tweet.
  int id;

  /// The string representation of the unique identifier for this Tweet.
  String idStr;

  /// The actual UTF-8 text of the status update.
  String text;

  /// Utility used to post the Tweet, as an HTML-formatted string.
  String source;

  /// Indicates whether the value of the text parameter was truncated, for example, as a result of a retweet exceeding the original Tweet text length limit of 140 characters.
  bool truncated;

  /// If the represented Tweet is a reply, this field will contain the integer representation of the original Tweet’s ID.
  int? inReplyToStatusId;

  /// If the represented Tweet is a reply, this field will contain the string representation of the original Tweet’s ID.
  String? inReplyToStatusIdStr;

  /// If the represented Tweet is a reply, this field will contain the integer representation of the original Tweet’s author ID.
  int? inReplyToUserId;

  /// If the represented Tweet is a reply, this field will contain the string representation of the original Tweet’s author ID.
  String? inReplyToUserIdStr;

  /// If the represented Tweet is a reply, this field will contain the screen name of the original Tweet’s author.
  String? inReplyToScrenName;

  /// The user who posted this Tweet. See User data dictionary for complete list of attributes.
  User user;

  /// Represents the geographic location of this Tweet as reported by the user or client application.
  Coordinates? coordinates;

  /// When present, indicates that the tweet is associated (but not necessarily originating from) a Place.
  Place? place;

  /// This field only surfaces when the Tweet is a quote Tweet.
  /// This field contains the integer value Tweet ID of the quoted Tweet.
  int? quotedStatusId;

  /// This field only surfaces when the Tweet is a quote Tweet.
  /// This is the string representation Tweet ID of the quoted Tweet.
  String? quotedStatusIdStr;

  /// Indicates whether this is a Quoted Tweet.
  bool isQuoteStatus;

  /// This field only surfaces when the Tweet is a quote Tweet.
  /// This attribute contains the Tweet object of the original Tweet that was quoted.
  Tweet? quotedStatus;

  /// Users can amplify the broadcast of Tweets authored by other users by retweeting.
  /// Retweets can be distinguished from typical Tweets by the existence of a retweeted_status attribute.
  /// This attribute contains a representation of the original Tweet that was retweeted.
  Tweet? retweetedStatus;

  /// Indicates approximately how many times this Tweet has been quoted by Twitter users.
  int? quoteCount;

  /// Number of times this Tweet has been replied to.
  int? replyCount;

  /// Number of times this Tweet has been retweeted.
  int retweetCount;

  /// Indicates approximately how many times this Tweet has been liked by Twitter users.
  int? favoriteCount;

  /// Entities which have been parsed out of the text of the Tweet.
  Entities entities;

  /// When between one and four native photos or one video or one animated GIF are in Tweet, contains an array 'media' metadata.
  ExtendedEntities extendedEntities;

  /// Indicates whether this Tweet has been liked by the authenticating user.
  bool? favorited;

  /// Indicates whether this Tweet has been Retweeted by the authenticating user.
  bool retweeted;

  /// This field only surfaces when a Tweet contains a link.
  /// The meaning of the field doesn’t pertain to the Tweet content itself, but instead it is an indicator that the URL contained in the Tweet may contain content or media identified as sensitive content.
  bool? possiblySensitive;

  /// Indicates the maximum value of the filter_level parameter which may be used and still stream this Tweet.
  String filterLevel;

  /// When present, indicates a BCP 47 language identifier corresponding to the machine-detected language of the Tweet text, or und if no language could be detected.
  String? lang;

  Tweet(
    this.createdAt,
    this.id,
    this.idStr,
    this.text,
    this.source,
    this.truncated,
    this.user,
    this.isQuoteStatus,
    this.retweetCount,
    this.entities,
    this.extendedEntities,
    this.retweeted,
    this.filterLevel,
    {
      this.inReplyToStatusId,
      this.inReplyToStatusIdStr,
      this.inReplyToUserId,
      this.inReplyToUserIdStr,
      this.inReplyToScrenName,
      this.coordinates,
      this.place,
      this.quotedStatusId,
      this.quotedStatusIdStr,
      this.quotedStatus,
      this.retweetedStatus,
      this.quoteCount,
      this.replyCount,
      this.favoriteCount,
      this.favorited,
      this.possiblySensitive,
      this.lang,
    }
  );

  factory Tweet.fromJson(Map<String, dynamic> json) => Tweet(
    json['created_at'],
    json['id'],
    json['id_str'],
    json['text'],
    json['source'],
    json['truncated'],
    User.fromJson(json['user']),
    json['is_quote_status'],
    json['retweet_count'],
    Entities.fromJson(json['entities']),
    ExtendedEntities.fromJson(json['extended_entities']),
    json['retweeted'],
    json['filter_level'],

    inReplyToStatusId: json['in_reply_to_status_id'],
    inReplyToStatusIdStr: json['in_reply_to_status_id_str'],
    inReplyToUserId: json['in_reply_to_user_id'],
    inReplyToUserIdStr: json['in_reply_to_user_id_str'],
    inReplyToScrenName: json['in_reply_to_screen_name'],
    coordinates: Coordinates.fromJson(json['coordinates']),
    place: Place.fromJson(json['place']),
    quotedStatusId: json['quoted_status_id'],
    quotedStatusIdStr: json['quoted_status_id_str'],
    quotedStatus: Tweet.fromJson(json['quoted_status']),
    retweetedStatus: Tweet.fromJson(json['retweeted_status']),
    quoteCount: json['quote_count'],
    replyCount: json['reply_count'],
    favoriteCount: json['favorite_count'],
    favorited: json['favorited'],
    possiblySensitive: json['possibly_sensitive'],
    lang: json['lang'],
  );
}