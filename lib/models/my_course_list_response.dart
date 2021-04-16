import 'package:flinnt/models/course.dart';

class MyCourseListResponse {
  final String coursePictureUrl;
  final String userPictureUrl;
  final String courseUserPictureUrl;
  final int hasMore;
  final List<Course> courseList;

  MyCourseListResponse({
    this.coursePictureUrl,
    this.userPictureUrl,
    this.courseUserPictureUrl,
    this.hasMore,
    this.courseList,
  });

  factory MyCourseListResponse.fromJson(Map<String, dynamic> data) {
    return MyCourseListResponse(
      coursePictureUrl: data['course_picture_url'],
      userPictureUrl: data['user_picture_url'],
      courseUserPictureUrl: data['course_user_picture_url'],
      hasMore: data['has_more'],
      courseList:
          [...data['courses']].map((item) => Course.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course_picture_url': coursePictureUrl,
      'user_picture_url': userPictureUrl,
      'course_user_picture_url': courseUserPictureUrl,
      'has_more': hasMore,
      'courses': courseList.map((e) => e.toJson()).toList(),
    };
  }
}
