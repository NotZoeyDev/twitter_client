import 'package:http/http.dart' as http;
import 'package:twitter_client/src/models/device_info.dart';
import 'package:twitter_client/twitter.dart'; 

const BASE_URL = "api.twitter.com";
const MEDIA_BASE_URL = "upload.twitter.com";

/// Wrapper class to call the Twitter API doing raw requests
class TwitterAPI {
  String _consumerKey;
  String _consumerSecret;
  String? _token;
  String? _tokenSecret;

  DeviceInfo? deviceInfo;
  
  TwitterAPI(
    this._consumerKey,
    this._consumerSecret,
    this._token,
    this._tokenSecret,
    {
      this.deviceInfo
    }
  );

  /// Call the Twitter API with proper oauth headers and signature
  /// [method] is the HTTP method to use, GET or POST.
  /// [url] is the full path for the endpoint, /1.1/some/thing.json
  Future<http.Response> _request(String method, String url, Map<String, String>? params, {Map<String, String>? body}) async {
    if (params == null) params = {};

    String baseUrl = url.contains("/media/") ? MEDIA_BASE_URL : BASE_URL;

    Uri originalUrl = Uri.parse("https://$baseUrl$url");
    Uri finalUrl = _fixedURL(baseUrl, url, params);
    
    // Create our OauthHelper instance
    OAuthHelper helper = new OAuthHelper(
      consumerKey: this._consumerKey,
      consumerSecret: this._consumerSecret,
      token: this._token, 
      tokenSecret: this._tokenSecret
    );

    if (body != null) {
      params.addAll(body);
    }

    // Create our oAuth signature and Authorization header
    String signature = helper.getSignature(method, originalUrl.toString(), params);
    String oauthHeader = helper.getAuthHeader(signature);

    // Set the proper headers
    Map<String, String> headers = {
      "Authorization": oauthHeader,
      //"Content-Type": "application/x-www-form-urlencoded"
    };

    // Add extra heders if needed
    headers.addAll(await _getExtraHeaders(helper.type));

    // Do our http request and return the response
    http.Response response;

    switch(method) {
      case "POST":
        response = await http.post(finalUrl, headers: headers, body: body);
        break;

      case "DELETE":
        response = await http.delete(finalUrl, headers: headers);
        break;

      default: 
        response = await http.get(finalUrl, headers: headers);
        break;
    }

    return response;
  }

  /// Get extra headers
  Future<Map<String, String>> _getExtraHeaders(KeyType? keyType) async {
    Map<String, String> extraHeaders = Map<String, String>();

    if (keyType == KeyType.Other) {
      return extraHeaders;
    }

    const String versionName = "8.91.1";
    const String apiVersion = "5";

    String clientName = "";
    switch(keyType) {
      case KeyType.iOS: 
        clientName = "Twitter-iPhone";
        break;

      case KeyType.iPad:
        clientName = "Twitter-Ipad";
        break;

      case KeyType.Android:
        clientName = "TwitterAndroid";
        break;

      case KeyType.Mac:
        clientName = "Twitter-Mac";
        break;

      default:
        break;
    }

    DeviceInfo? info = this.deviceInfo;
    if (info == null) {
      switch(keyType) {
        case KeyType.iOS: 
          // iPhone 12
          info = new DeviceInfo(
            manufacturer: "Apple",
            model: "iOS",
            sdkVersion: "15.1",
            brand: "2020",
            product: "iPhone13.2",
          );
          break;

        case KeyType.iPad:
          // iPad 8th
          info = new DeviceInfo(
            manufacturer: "Apple",
            model: "iOS",
            sdkVersion: "15.1",
            brand: "2020",
            product: "iPad11,6",
          );
          break;

        case KeyType.Mac:
          // Macbook Pro m1
          info = new DeviceInfo(
            manufacturer: "Apple",
            model: "iOS",
            sdkVersion: "15.0",
            brand: "2021",
            product: "MacBookPro17,1",
          );
          break;

        case KeyType.Android:
          // Pixel 3
          info = new DeviceInfo(
            model: "Pixel 3",
            sdkVersion: "30",
            manufacturer: "Google",
            brand: "google",
            product: "blueline",
          );
          break;

        default:
          info = new DeviceInfo(
            manufacturer: "",
            model: "",
            sdkVersion: "",
            brand: "",
            product: "",
          );
          break;
      }
    }

    final String userAgent = keyType == KeyType.Android
      ? "$clientName/$versionName ${info.model}/${info.sdkVersion} (${info.manufacturer};${info.model};${info.brand};${info.product};0;;0)"
      : "$clientName/$versionName ${info.model}/${info.sdkVersion} (${info.manufacturer};${info.product};;;;;1;${info.brand})";

    extraHeaders.addAll({
      "User-Agent": userAgent,
      "Accept-Language": "en_US",
      "X-Twitter-Client": clientName,
      "X-Twitter-Client-Language": "en_US",
      "X-Twitter-Client-Version": versionName,
      "X-Twitter-API-Version": apiVersion
    });

    return extraHeaders;
  }

  // Twitter's oAuth is garbage
  // If the URL includes some query, it needs to be included in the oauth signature
  // The final URL includes the "data" as part of the query but these shouldn't be part of the oauth signature
  // This fixes the url and add the missing query info that aren't part of the base url
  Uri _fixedURL(String baseUrl, String url, Map<String, String>? params) {
    Map<String, String>? paramsWithQuery = params;
    String urlWithoutQuery = "";

    Uri.parse(url).queryParameters.forEach((key, value) {
      paramsWithQuery!.addAll({key: value});
    });

    urlWithoutQuery = url.replaceAll("?${Uri.parse(url).query}", "");

    return Uri.https(baseUrl, urlWithoutQuery, paramsWithQuery);
  }

  /// Generate a proper map for params
  Map<String, String> createParams(Map<String, dynamic> json) {
    json.removeWhere((key, value) => value == null);
    return json.map((key, value) => MapEntry(key, value.toString()));
  }

  /// Do a post request to [url] using the [params] and [body]
  Future<http.Response> post(String url, {Map<String, String>? params, Map<String, String>? body}) async {
    if (body == null) body = new Map();
    return await _request("POST", url, params, body: body);
  }

  /// Do a get request to [url] using the [params] and [body]
  Future<http.Response> get(String url, {Map<String, String>? params}) async {
    return await _request("GET", url, params);
  }

  /// Do a delete request to [url] using the [params] and [body]
  Future<http.Response> delete(String url, {Map<String, String>? params}) async {
    return await _request("DELETE", url, params);
  }
}