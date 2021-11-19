import 'dart:convert';

import 'package:http/http.dart';
import 'package:twitter_client/src/api.dart';
import 'package:twitter_client/src/responses/media.dart';

class Media {
  final TwitterAPI twitter;
  late final MediaMetadata metadata;
  late final MediaSubtitles subtitles;

  Media(this.twitter) {
    this.metadata = new MediaMetadata(twitter);
    this.subtitles = new MediaSubtitles(twitter);
  }

  /// Use this endpoint to upload images to Twitter.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload
  Future<MediaUpload> upload({
    /// The raw binary file content being uploaded.
    String? media,

    /// The category that represents how the media will be used. This field is required when using the media with the Ads APIPossible values: amplify_video, tweet_gif, tweet_image, and tweet_video.
    String? mediaCategory,

    /// The base64-encoded file content being uploaded.
    String? mediaData,

    /// A comma-separated list of user IDs to set as additional owners allowed to use the returned media_id in Tweets or Cards.
    List<String>? additionalOwners,
  }) async {
    if (media == null && mediaData == null) {
      throw "Either media or mediaData has to be set";
    }

    if (media != null && mediaData != null) {
      throw "Both media or mediaData cannot be set";
    }

    Map<String, String> params = twitter.createParams({
      'media_category': mediaCategory,
      'additional_owners': additionalOwners?.join(','),
    });

    Map<String, String> body = twitter.createParams({
      'media': media,
      'media_data': mediaData
    });

    Response response = await twitter.post("/1.1/media/upload.json", params: params, body: body);
    if (response.statusCode != 200) {
      throw "Something went wrong during the upload";
    }

    return MediaUpload.fromJson(jsonDecode(response.body));
  }

  /// The INIT command request is used to initiate a file upload session.
  /// It returns a media_id which should be used to execute all subsequent requests.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload-init 
  Future<MediaUpload> init({
    /// The size of the media being uploaded in bytes.
    required int totalBytes,

    /// The MIME type of the media being uploaded.
    required String mediaType,

    /// A string enum value which identifies a media usecase.
    String? mediaCategory,

    /// A comma-separated list of user IDs to set as additional owners allowed to use the returned media_id in Tweets or Cards.
    List<int>? additionalOwners,
  }) async {
    Map<String, String> params = twitter.createParams({
      'command': "INIT",
      'total_bytes': totalBytes,
      'media_type': mediaType,
      'media_category': mediaCategory,
      'additional_owners': additionalOwners?.join(',')
    });

    Response response = await twitter.post("/1.1/media/upload.json", params: params);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw "error initializing chunk upload";
    }

    return MediaUpload.fromJson(jsonDecode(response.body));
  }

  /// The APPEND command is used to upload a chunk (consecutive byte range) of the media file.
  /// For example, a 3 MB file could be split into 3 chunks of size 1 MB, and uploaded using 3 APPEND command requests.
  /// After the entire file is uploaded, the next step is to call the FINALIZE command.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload-append
  Future<void> append({
    /// The media_id returned from the INIT command.
    required int mediaID,

    /// The raw binary file content being uploaded.
    String? media,

    /// The base64-encoded chunk of media file.
    String? mediaData,

    /// An ordered index of file chunk. It must be between 0-999 inclusive.
    required int segmentIndex,
  }) async {
    if (media == null && mediaData == null) {
      throw "either media or mediaData has to be set";
    }

    if (media != null && mediaData != null) {
      throw "both media or mediaData cannot be set";
    }

    Map<String, String> params = twitter.createParams({
      'command': "APPEND",
      'media_id': mediaID,
      'segment_index': segmentIndex
    });

    Map<String, String> body = twitter.createParams({
      'media': media,
      'media_data': mediaData,
    });

    Response response = await twitter.post("/1.1/media/upload.json", params: params, body: body);
     if (response.statusCode < 200 || response.statusCode >= 300) {
      print(response.body);
      throw "error appending upload";
    }
  }

  /// The STATUS command is used to periodically poll for updates of media processing operation.
  /// After the STATUS command response returns succeeded, you can move on to the next step which is usually create Tweet with media_id.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/get-media-upload-status
  Future<MediaUpload> status({
    /// The media_id returned from the INIT command.
    required int mediaID,
  }) async {
    Map<String, String> params = twitter.createParams({
      'command': "STATUS",
      'media_id': mediaID,
    });

    Response response = await twitter.get("/1.1/media/upload.json", params: params);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      print(response.body);
      throw "error getting upload status";
    }

    return MediaUpload.fromJson(jsonDecode(response.body));
  }

  /// The FINALIZE command should be called after the entire media file is uploaded using APPEND commands.
  /// If and (only if) the response of the FINALIZE command contains a processing_info field, it may also be necessary to use a STATUS command and wait for it to return success before proceeding to Tweet creation.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload-finalize
  Future<MediaUpload> finalize({
    /// The media_id returned from the INIT command.
    required int mediaID,
  }) async {
    Map<String, String> params = twitter.createParams({
      'command': "FINALIZE",
      'media_id': mediaID,
    });

    Response response = await twitter.post("/1.1/media/upload.json", params: params);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw "error finalizing upload";
    }

    return MediaUpload.fromJson(jsonDecode(response.body));
  }
}

class MediaMetadata {
  final TwitterAPI twitter;

  MediaMetadata(this.twitter);

  /// This endpoint can be used to provide additional information about the uploaded media_id.
  /// This feature is currently only supported for images and GIFs.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-metadata-create
  Future<void> create() async {

  }
}

class MediaSubtitles {
  final TwitterAPI twitter;

  MediaSubtitles(this.twitter);

  /// Use this endpoint to associate uploaded subtitles to an uploaded video.
  /// You can associate subtitles to video before or after Tweeting.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-subtitles-create
  Future<void> create() async {

  }

  /// Use this endpoint to dissociate subtitles from a video and delete the subtitles.
  /// You can dissociate subtitles from a video before or after Tweeting.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-subtitles-delete
  Future<void> delete() async {

  }
}