import 'package:twitter_client/src/objects/tweet.dart';

/// User Object
/// 
/// https://developer.twitter.com/en/docs/twitter-api/v1/data-dictionary/object-model/user
class User {
  /// The integer representation of the unique identifier for this User.
  int id;

  /// The string representation of the unique identifier for this User.
  String idStr;
  
  /// The name of the user, as they’ve defined it.
  String name;

  /// The screen name, handle, or alias that this user identifies themselves with. screen_names are unique but subject to change.
  String screenName;

  /// The user-defined location for this account’s profile.  
  String? location;

  /// A URL provided by the user in association with their profile.
  String? url;

  /// The user-defined UTF-8 string describing their account.
  String? description;

  /// When true, indicates that this user has chosen to protect their Tweets. 
  bool? protected;

  /// When true, indicates that the user has a verified account.
  bool? verified;

  /// The number of followers this account currently has.
  int? followersCount;

  /// The number of users this account is following (AKA their “followings”).
  int? friendsCount;

  /// The number of public lists that this user is a member of.
  int? listedCount;

  /// The number of Tweets this user has liked in the account’s lifetime.
  int? favouritesCount;

  /// The number of Tweets (including retweets) issued by the user.
  int? statusesCount;

  /// The UTC datetime that the user account was created on Twitter.
  String? createdAt;

  /// The HTTPS-based URL pointing to the standard web representation of the user’s uploaded profile banner.
  String? profileBannerUrl;

  /// A HTTPS-based URL pointing to the user’s profile image.
  String? profileImageUrlHttps;

  /// When true, indicates that the user has not altered the theme or background of their user profile
  bool? defaultProfile;

  /// When true, indicates that the user has not uploaded their own profile image and a default image is used instead.
  bool? defaultProfileImage;

  /// When present, indicates a list of uppercase two-letter country codes this content is withheld from.
  List<String>? withheldInCountries;

  /// When present, indicates that the content being withheld is a “user.”
  String? withheldScope;

  Tweet? status;  

  User(
    this.id,
    this.idStr,
    this.name,
    this.screenName,
    this.createdAt,
    {
      this.protected,
      this.verified,
      this.followersCount,
      this.friendsCount,
      this.listedCount,
      this.favouritesCount,
      this.statusesCount,
      this.profileBannerUrl,
      this.profileImageUrlHttps,
      this.defaultProfile,
      this.defaultProfileImage,
      this.withheldInCountries,
      this.withheldScope,
      this.location,
      this.url,
      this.description,
      this.status,
    }
  );

  factory User.fromJson(Map<String, dynamic> json) => User(
    json['id'],
    json['id_str'],
    json['name'],
    json['screen_name'],
    json['created_at'],

    protected: json['protected'],
    verified: json['verified'],
    followersCount: json['followers_count'],
    friendsCount: json['friends_count'],
    listedCount: json['listed_count'],
    favouritesCount: json['favourites_count'],
    statusesCount: json['statuses_count'],
    profileBannerUrl: json['profile_banner_url'],
    profileImageUrlHttps: json['profile_image_url_https'],
    defaultProfile: json['default_profile'],
    defaultProfileImage: json['default_profile_image'],
    withheldInCountries: json['withheld_in_countries'] != null ? json['withheld_in_countries'].cast<String>() : null,
    withheldScope: json['withheld_scope'],
    location: json['location'],
    url: json['url'],
    description: json['description'],
    status: json['status'] != null ? Tweet.fromJson(json['status']) : null,
  );
}