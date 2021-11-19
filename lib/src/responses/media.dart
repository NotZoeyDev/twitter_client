class MediaUpload {
  int? mediaID;
  String? mediaIDString;
  String? mediaKey;
  int? size;
  int? expiresAfterSecs;
  _MediaUploadImage? image;
  _MediaUploadInfo? processingInfo;
  
  MediaUpload(
    this.mediaID,
    this.mediaIDString,
    this.mediaKey,
    this.size,
    this.expiresAfterSecs,
    this.image,
    this.processingInfo,
  );

  factory MediaUpload.fromJson(Map<String, dynamic> json) => MediaUpload(
    json['media_id'],
    json['media_id_string'],
    json['media_key'],
    json['size'],
    json['expires_after_secs'],
    json['image'] != null ? _MediaUploadImage.fromJson(json['image']) : null,
    json['processing_info'] != null ? _MediaUploadInfo.fromJson(json['processing_info']) : null,
  );
}

class _MediaUploadImage {
  String? imageType;
  int? w;
  int? h;

  _MediaUploadImage(this.imageType, this.w, this.h);

  factory _MediaUploadImage.fromJson(Map<String, dynamic> json) => _MediaUploadImage(
    json['image_type'],
    json['w'],
    json['h']
  );
}

class _MediaUploadInfo {
  String? state;
  int? checkAfterSecs;
  int? progressPercent;
  _MediaUploadInfoError? error;

  _MediaUploadInfo(this.state, this.checkAfterSecs, this.progressPercent, this.error);

  factory _MediaUploadInfo.fromJson(Map<String, dynamic> json) => _MediaUploadInfo(
    json['state'],
    json['check_after_secs'],
    json['progress_percent'],
    _MediaUploadInfoError.fromJson(json['error']),
  );
}

class _MediaUploadInfoError {
  int? code;
  String? name;
  String? message;

  _MediaUploadInfoError(this.code, this.name, this.message);

  factory _MediaUploadInfoError.fromJson(Map<String, dynamic> json) => _MediaUploadInfoError(
    json['code'],
    json['name'],
    json['message']
  );
}