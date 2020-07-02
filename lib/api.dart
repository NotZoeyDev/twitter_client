/// Twitter API wrapper to make simple request to Twitter's servers
/// @ZoeyLovesMiki, 2020

import 'package:http/http.dart' as http;
import 'package:twitter_client/auth.dart'; 

const BASE_URL = "api.twitter.com";

/// TwitterAPI
class TwitterAPI {
  String consumerKey;
  String consumerSecret;
  String token;
  String tokenSecret;
  
  TwitterAPI({
    this.consumerKey,
    this.consumerSecret,
    this.token = "",
    this.tokenSecret = ""
  });

  Future<http.Response> _request(String method, String url, Map<String, String> params) async {
    if (params == null) params = {};

    Uri originalUrl = Uri.parse("https://$BASE_URL$url");

    Uri finalUrl = _fixedURL(url, params);
    
    OAuthHelper helper = new OAuthHelper(
      consumerKey: this.consumerKey,
      consumerSecret: this.consumerSecret,
      token: this.token, 
      tokenSecret: this.tokenSecret
    );

    String signature = helper.getSignature(method, originalUrl.toString(), params);
    String oauthHeader = helper.getAuthHeader(signature);

    Map<String, String> headers = {
      "Authorization": oauthHeader,
      "Content-Type": "application/x-www-form-urlencoded"
    };

    http.Response response;

    if (method == "POST") {
      response = await http.post(finalUrl, headers: headers);
    } else {
      response = await http.get(finalUrl, headers: headers);
    }

    return response;
  }

  // Twitter's oAuth is garbage
  // If the URL includes some query, it needs to be included in the oauth signature
  // The final URL includes the "data" as part of the query but these shouldn't be part of the oauth signature
  // This fixes the url and add the missing query info that aren't part of the base url
  Uri _fixedURL(String url, Map<String, String> params) {
    Map<String, String> paramsWithQuery = params;
    String urlWithoutQuery = "";

    Uri.parse(url).queryParameters.forEach((key, value) {
      paramsWithQuery.addAll({key: value});
    });

    urlWithoutQuery = url.replaceAll("?${Uri.parse(url).query}", "");

    return Uri.https("api.twitter.com", urlWithoutQuery, paramsWithQuery);
  }

  Future<http.Response> post(String url, {Map<String, String> params}) async{
    return await _request("POST", url, params);
  }

  Future<http.Response> get(String url, {Map<String, String> params}) async {
    return await _request("GET", url, params);
  }
}