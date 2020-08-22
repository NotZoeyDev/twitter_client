class AccessToken {
  String token;
  String tokenSecret;
  String screenName;

  AccessToken({
    this.token,
    this.tokenSecret,
    this.screenName
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
    token: json['oauth_token'],
    tokenSecret: json['oauth_token_secret'],
    screenName: json['screen_name']
  );
}