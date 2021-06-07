class CourseContentDetailResponse {
  final String allowComment;
  final String approveComment;
  final String videoPreviewUrl;
  final String attachmentUrl;
  final Map<String, dynamic> thirdParty;
  final CourseContent content;

  CourseContentDetailResponse({
    this.videoPreviewUrl,
    this.attachmentUrl,
    this.thirdParty,
    this.content,
    this.allowComment,
    this.approveComment,
  });

  factory CourseContentDetailResponse.fromJson(Map<String, dynamic> data) {
    print('CourseContentDetailResponseModel[21]- data: $data');
    return CourseContentDetailResponse(
      allowComment: data['allow_comment'].toString(),
      approveComment: data['approve_comment'].toString(),
      thirdParty: data['third_party'],
      videoPreviewUrl: data['video_preview_url'],
      attachmentUrl: data['attachment_url'],
      content: CourseContent.fromJson(data['content']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'allow_comment': allowComment,
      'approve_comment': approveComment,
      'third_party': thirdParty,
      'video_preview_url': videoPreviewUrl,
      'attachment_url': attachmentUrl,
      'contetn': content.toJson(),
    };
  }
}

class CourseContent {
  final String id;
  final String title;
  final String description;
  final String sectionTitle;
  final String attachmentType;
  final String attachment;
  final String attachmentIsUrl;
  final String attachmentVideoThumb;
  final String attachmentVideoUrlSource;
  final String attachmentDoEncode;
  final String likeStatus;
  final String courseName;
  final String coursePicture;
  final String coursePictureUrl;

  CourseContent({
    this.id,
    this.title,
    this.description,
    this.sectionTitle,
    this.attachmentType,
    this.attachment,
    this.attachmentIsUrl,
    this.attachmentVideoThumb,
    this.attachmentVideoUrlSource,
    this.attachmentDoEncode,
    this.likeStatus,
    this.courseName,
    this.coursePicture,
    this.coursePictureUrl,
  });

  factory CourseContent.fromJson(Map<String, dynamic> data) {
    print('CourseContentDetailResponseModel[77]- data: $data');
    return CourseContent(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      sectionTitle: data['section_title'],
      attachmentType: data['attachment_type'],
      attachment: data['attachment'],
      attachmentIsUrl: data['attachment_is_url'],
      attachmentVideoThumb: data['attachment_video_thumb'],
      attachmentVideoUrlSource: data['attachment_video_url_source'],
      attachmentDoEncode: data['attachment_do_encode'].toString(),
      likeStatus: data['like_status'],
      courseName: data['course_name'],
      coursePicture: data['course_picture'],
      coursePictureUrl: data['course_picture_url'],
    );
  }

  toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'section_title': sectionTitle,
      'attachment_type': attachmentType,
      'attachment': attachment,
      'attachment_is_url': attachmentIsUrl,
      'attachment_video_url_source': attachmentVideoUrlSource,
      'attachment_do_encode': attachmentDoEncode,
      'like_statue': likeStatus,
      'course_name': courseName,
      'course_picture': coursePicture,
      'course_picture_url': coursePictureUrl,
    };
  }
}
