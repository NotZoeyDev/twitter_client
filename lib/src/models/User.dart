import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.idStr,
    this.name,
    this.screenName,
    this.location,
    this.profileLocation,
    this.description,
    this.url,
    this.entities,
    this.protected,
    this.followersCount,
    this.friendsCount,
    this.listedCount,
    this.createdAt,
    this.favouritesCount,
    this.utcOffset,
    this.timeZone,
    this.geoEnabled,
    this.verified,
    this.statusesCount,
    this.lang,
    this.contributorsEnabled,
    this.isTranslator,
    this.isTranslationEnabled,
    this.profileBackgroundColor,
    this.profileBackgroundImageUrl,
    this.profileBackgroundImageUrlHttps,
    this.profileBackgroundTile,
    this.profileImageUrl,
    this.profileImageUrlHttps,
    this.profileBannerUrl,
    this.profileLinkColor,
    this.profileSidebarBorderColor,
    this.profileSidebarFillColor,
    this.profileTextColor,
    this.profileUseBackgroundImage,
    this.hasExtendedProfile,
    this.defaultProfile,
    this.defaultProfileImage,
    this.following,
    this.followRequestSent,
    this.notifications,
    this.translatorType,
  });

  int id;
  String idStr;
  String name;
  String screenName;
  String location;
  dynamic profileLocation;
  String description;
  String url;
  Entities entities;
  bool protected;
  int followersCount;
  int friendsCount;
  int listedCount;
  String createdAt;
  int favouritesCount;
  dynamic utcOffset;
  dynamic timeZone;
  dynamic geoEnabled;
  bool verified;
  int statusesCount;
  dynamic lang;
  dynamic contributorsEnabled;
  dynamic isTranslator;
  dynamic isTranslationEnabled;
  dynamic profileBackgroundColor;
  dynamic profileBackgroundImageUrl;
  dynamic profileBackgroundImageUrlHttps;
  dynamic profileBackgroundTile;
  dynamic profileImageUrl;
  String profileImageUrlHttps;
  dynamic profileBannerUrl;
  dynamic profileLinkColor;
  dynamic profileSidebarBorderColor;
  dynamic profileSidebarFillColor;
  dynamic profileTextColor;
  dynamic profileUseBackgroundImage;
  dynamic hasExtendedProfile;
  bool defaultProfile;
  bool defaultProfileImage;
  dynamic following;
  dynamic followRequestSent;
  dynamic notifications;
  dynamic translatorType;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    idStr: json["id_str"],
    name: json["name"],
    screenName: json["screen_name"],
    location: json["location"],
    profileLocation: json["profile_location"],
    description: json["description"],
    url: json["url"],
    entities: Entities.fromJson(json["entities"]),
    protected: json["protected"],
    followersCount: json["followers_count"],
    friendsCount: json["friends_count"],
    listedCount: json["listed_count"],
    createdAt: json["created_at"],
    favouritesCount: json["favourites_count"],
    utcOffset: json["utc_offset"],
    timeZone: json["time_zone"],
    geoEnabled: json["geo_enabled"],
    verified: json["verified"],
    statusesCount: json["statuses_count"],
    lang: json["lang"],
    contributorsEnabled: json["contributors_enabled"],
    isTranslator: json["is_translator"],
    isTranslationEnabled: json["is_translation_enabled"],
    profileBackgroundColor: json["profile_background_color"],
    profileBackgroundImageUrl: json["profile_background_image_url"],
    profileBackgroundImageUrlHttps: json["profile_background_image_url_https"],
    profileBackgroundTile: json["profile_background_tile"],
    profileImageUrl: json["profile_image_url"],
    profileImageUrlHttps: json["profile_image_url_https"],
    profileBannerUrl: json["profile_banner_url"],
    profileLinkColor: json["profile_link_color"],
    profileSidebarBorderColor: json["profile_sidebar_border_color"],
    profileSidebarFillColor: json["profile_sidebar_fill_color"],
    profileTextColor: json["profile_text_color"],
    profileUseBackgroundImage: json["profile_use_background_image"],
    hasExtendedProfile: json["has_extended_profile"],
    defaultProfile: json["default_profile"],
    defaultProfileImage: json["default_profile_image"],
    following: json["following"],
    followRequestSent: json["follow_request_sent"],
    notifications: json["notifications"],
    translatorType: json["translator_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_str": idStr,
    "name": name,
    "screen_name": screenName,
    "location": location,
    "profile_location": profileLocation,
    "description": description,
    "url": url,
    "entities": entities.toJson(),
    "protected": protected,
    "followers_count": followersCount,
    "friends_count": friendsCount,
    "listed_count": listedCount,
    "created_at": createdAt,
    "favourites_count": favouritesCount,
    "utc_offset": utcOffset,
    "time_zone": timeZone,
    "geo_enabled": geoEnabled,
    "verified": verified,
    "statuses_count": statusesCount,
    "lang": lang,
    "contributors_enabled": contributorsEnabled,
    "is_translator": isTranslator,
    "is_translation_enabled": isTranslationEnabled,
    "profile_background_color": profileBackgroundColor,
    "profile_background_image_url": profileBackgroundImageUrl,
    "profile_background_image_url_https": profileBackgroundImageUrlHttps,
    "profile_background_tile": profileBackgroundTile,
    "profile_image_url": profileImageUrl,
    "profile_image_url_https": profileImageUrlHttps,
    "profile_banner_url": profileBannerUrl,
    "profile_link_color": profileLinkColor,
    "profile_sidebar_border_color": profileSidebarBorderColor,
    "profile_sidebar_fill_color": profileSidebarFillColor,
    "profile_text_color": profileTextColor,
    "profile_use_background_image": profileUseBackgroundImage,
    "has_extended_profile": hasExtendedProfile,
    "default_profile": defaultProfile,
    "default_profile_image": defaultProfileImage,
    "following": following,
    "follow_request_sent": followRequestSent,
    "notifications": notifications,
    "translator_type": translatorType,
  };
}

class Entities {
    Entities({
      this.url,
      this.description,
    });

    Description url;
    Description description;

    factory Entities.fromJson(Map<String, dynamic> json) => Entities(
      url: Description.fromJson(json["url"]),
      description: Description.fromJson(json["description"]),
    );

    Map<String, dynamic> toJson() => {
      "url": url.toJson(),
      "description": description.toJson(),
    };
}

class Description {
  Description({
    this.urls,
  });

  List<Url> urls;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
  };
}

class Url {
  Url({
    this.url,
    this.expandedUrl,
    this.displayUrl,
    this.indices,
  });

  String url;
  String expandedUrl;
  String displayUrl;
  List<int> indices;

  factory Url.fromJson(Map<String, dynamic> json) => Url(
    url: json["url"],
    expandedUrl: json["expanded_url"],
    displayUrl: json["display_url"],
    indices: List<int>.from(json["indices"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "expanded_url": expandedUrl,
    "display_url": displayUrl,
    "indices": List<dynamic>.from(indices.map((x) => x)),
  };
}
