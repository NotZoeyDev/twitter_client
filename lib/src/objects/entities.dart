import 'sizes.dart';

/// Entities object
/// 
/// https://developer.twitter.com/en/docs/twitter-api/v1/data-dictionary/object-model/entities
class Entities {
  /// Represents hashtags which have been parsed out of the Tweet text.
  List<Hashtag>? hashtags;

  /// Represents media elements uploaded with the Tweet.
  List<Media>? media;

  /// Represents URLs included in the text of a Tweet.
  List<URL>? urls;

  /// Represents other Twitter users mentioned in the text of the Tweet.
  List<UserMention>? userMentions;

  /// Represents symbols, i.e. $cashtags, included in the text of the Tweet.
  List<Symbol>? symbols;

  Entities({
    this.hashtags,
    this.media,
    this.urls,
    this.userMentions,
    this.symbols,
  });

  factory Entities.fromJson(Map<String, dynamic> json) => Entities(
    hashtags: json['hashtags'] != null ? json['hashtags'].map((hashtag) => Hashtag.fromJson(hashtag)).toList().cast<Hashtag>() : null,
    media: json['media'] != null ? json['media'].map((media) => Media.fromJson(media)).toList().cast<Media>() : null,
    urls: json['urls'] != null ? json['urls'].map((url) => URL.fromJson(url)).toList().cast<URL>() : null,
    userMentions: json['user_mentions'] != null ? json['user_mentions'].map((mention) => UserMention.fromJson(mention)).toList().cast<UserMention>() : null,
    symbols: json['symbols'] != null ? json['symbols'].map((symbol) => Symbol.fromJson(symbol)).toList().cast<Symbol>() : null,
  );
}

class ExtendedEntities {
  List<Media>? media;

  ExtendedEntities({
    this.media,
  });

  factory ExtendedEntities.fromJson(Map<String, dynamic> json) => ExtendedEntities(
    media: json['media'] != null ? json['media'].map((media) => Media.fromJson(media)).toList().cast<Media>() : null,
  );
}

/// Hashtag object  
class Hashtag {
  /// An array of integers indicating the offsets within the Tweet text where the hashtag begins and ends.
  List<int> indices;

  /// Name of the hashtag, minus the leading ‘#’ character.
  String text;

  Hashtag(
    this.indices,
    this.text,
  );

  factory Hashtag.fromJson(Map<String, dynamic>? json) => Hashtag(
    json?['indices'],
    json?['text'],
  );
}

/// Media object
class Media {
  /// URL of the media to display to clients.
  String displayUrl;

  /// An expanded version of display_url. Links to the media display page.
  String expandedUrl;

  /// ID of the media expressed as a 64-bit integer.
  int id;

  /// ID of the media expressed as a string.
  String idStr;

  /// An array of integers indicating the offsets within the Tweet text where the URL begins and ends.
  List<int> indices;

  /// An http:// URL pointing directly to the uploaded media file.
  String mediaUrl;
  
  /// An https:// URL pointing directly to the uploaded media file, for embedding on https pages.
  String mediaUrlHttps;

  /// An object showing available sizes for the media file.
  Sizes? sizes;

  /// For Tweets containing media that was originally associated with a different tweet, this ID points to the original Tweet.
  int? sourceStatusId;

  /// For Tweets containing media that was originally associated with a different tweet, this string-based ID points to the original Tweet.
  String? sourceStatusIdStr;

  /// Type of uploaded media. Possible types include photo, video, and animated_gif.
  String type;

  /// Wrapped URL for the media link.
  /// This corresponds with the URL embedded directly into the raw Tweet text, and the values for the indices parameter.
  String url;

  Media(
    this.displayUrl,
    this.expandedUrl,
    this.id,
    this.idStr,
    this.indices,
    this.mediaUrl,
    this.mediaUrlHttps,
    this.sizes,
    this.type,
    this.url,
    {
      this.sourceStatusId,
      this.sourceStatusIdStr
    }
  );

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    json['display_url'],
    json['expanded_url'],
    json['id'],
    json['id_str'],
    json['indices'].cast<int>(),
    json['media_url'],
    json['media_url_https'],
    json['sizes'] != null ? Sizes.fromJson(json['sizes']) : null,
    json['type'],
    json['url'],
    sourceStatusId: json['source_status_id'],
    sourceStatusIdStr: json['source_status_id_str'],
  );
}

/// URL object
class URL {
  /// URL pasted/typed into Tweet.
  String displayUrl;

  /// Expanded version of [displayUrl].
  String expandedUrl;

  /// An array of integers representing offsets within the Tweet text where the URL begins and ends.
  List<int> indices;

  /// Wrapped URL, corresponding to the value embedded directly into the raw Tweet text, and the values for the indices parameter.
  String url;

  URL(
    this.displayUrl,
    this.expandedUrl,
    this.indices,
    this.url,
  );

  factory URL.fromJson(Map<String, dynamic>? json) => URL(
    json?['display_url'],
    json?['expanded_url'],
    json?['indices'],
    json?['url'],
  );
}

/// User Mention object
class UserMention {
  /// ID of the mentioned user, as an integer.
  int id;

  /// ID of the mentioned user, as a string.
  String idStr;

  /// An array of integers representing the offsets within the Tweet text where the user reference begins and ends.
  List<int> indices;

  /// Display name of the referenced user.
  String name;

  /// Screen name of the referenced user.
  String screenName;

  UserMention(
    this.id,
    this.idStr,
    this.indices,
    this.name,
    this.screenName,
  );

  factory UserMention.fromJson(Map<String, dynamic>? json) => UserMention(
    json?['id'],
    json?['id_str'],
    json?['indices'],
    json?['name'],
    json?['screen_name'],
  );
}


/// Symbol object
class Symbol {
  /// An array of integers indicating the offsets within the Tweet text where the symbol/cashtag begins and ends.
  List<int> indices;

  /// Name of the cashhtag, minus the leading ‘$’ character.
  String text;

  Symbol(
    this.indices,
    this.text
  );

  factory Symbol.fromJson(Map<String, dynamic>? json) => Symbol(
    json?['indices'],
    json?['text'],
  );
}