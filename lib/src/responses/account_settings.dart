class AccountSettings {
  bool alwaysUseHttps;
  bool discoverableByEmail;
  bool geoEnabled;
  String language;
  bool protected;
  String screenName;
  bool showAllInlineMedia;
  SleepTime sleepTime;
  TimeZone? timeZone;
  List<TrendLocation>? trendLocation;
  bool useCookiePersonalization;
  String allowContributorRequest;

  AccountSettings(
    this.alwaysUseHttps,
    this.discoverableByEmail,
    this.geoEnabled,
    this.language,
    this.protected,
    this.screenName,
    this.showAllInlineMedia,
    this.sleepTime,
    this.useCookiePersonalization,
    this.allowContributorRequest,
    {
      this.timeZone,
      this.trendLocation,
    }
  );

  factory AccountSettings.fromJson(Map<String, dynamic> json) => AccountSettings(
    json['always_use_https'],
    json['discoverable_by_email'],
    json['geo_enabled'],
    json['language'],
    json['protected'],
    json['screen_name'],
    json['show_all_inline_media'],
    SleepTime.fromJson(json['sleep_time']),
    json['use_cookie_personalization'],
    json['allow_contributor_request'],
    timeZone: json['time_zone'],
    trendLocation: json['trend_location']?.cast<List<dynamic>>().map((location) => TrendLocation.fromJson(location)) ?? null
  );
}

class SleepTime {
  bool enabled;
  int? endTime;
  int? startTime;

  SleepTime(
    this.enabled,
    {
      this.endTime,
      this.startTime
    }
  );

  factory SleepTime.fromJson(Map<String, dynamic> json) => SleepTime(
    json['enabled'],
    endTime: json['end_time'],
    startTime: json['start_time'],
  );
}

class TimeZone {
  String name;
  String tzInfoName;
  int utcOffset;

  TimeZone(
    this.name,
    this.tzInfoName,
    this.utcOffset
  );

  factory TimeZone.fromJson(Map<String, dynamic> json) => TimeZone(
    json['name'],
    json['tzinfo_name'],
    json['utc_offset']
  );
}

class TrendLocation {
  String name;
  PlaceType placeType;
  int woeID;
  String country;
  String url;
  String countryCode;
  int parentID;

  TrendLocation(
    this.name,
    this.placeType,
    this.woeID,
    this.country,
    this.url,
    this.countryCode,
    this.parentID
  );

  factory TrendLocation.fromJson(Map<String, dynamic> json) => TrendLocation(
    json['name'],
    PlaceType.fromJson(json['placeType']),
    json['woeid'],
    json['country'],
    json['url'],
    json['countryCode'],
    json['parentid'],
  );
}

class PlaceType {
  String name;
  int code;

  PlaceType(
    this.name,
    this.code,
  );

  factory PlaceType.fromJson(Map<String, dynamic> json) => PlaceType(
    json['name'],
    json['code'],
  );
}