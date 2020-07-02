class RequestToken {
  String oauthToken;
  String oauthTokenSecret;

  RequestToken({
    this.oauthToken,
    this.oauthTokenSecret
  });

  factory RequestToken.fromJson(Map<String, dynamic> json) => RequestToken(
    oauthToken: json['oauth_token'],
    oauthTokenSecret: json['oauth_token_secret']
  );
}