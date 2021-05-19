import 'package:flinnt/models/course.dart';

class InstituteCourseListResponse {
  final String coursePictureUrl;
  final String userPictureUrl;
  final String instituteBannerUrl;
  final String instituteBanner;
  final int hasMore;
  final List<Course> courseList;

  InstituteCourseListResponse({
    this.instituteBannerUrl,
    this.instituteBanner,
    this.coursePictureUrl,
    this.userPictureUrl,
    this.hasMore,
    this.courseList,
  });

  factory InstituteCourseListResponse.fromJson(Map<String, dynamic> data) {
    return InstituteCourseListResponse(
      coursePictureUrl: data['picture_url'],
      userPictureUrl: data['user_picture_url'],
      instituteBannerUrl: data['institute_banner_url'],
      instituteBanner: data['institute_banner'],
      hasMore: data['has_more'],
      courseList:
          [...data['courses']].map((item) => Course.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course_picture_url': coursePictureUrl,
      'user_picture_url': userPictureUrl,
      'institute_banner_url': instituteBannerUrl,
      'institute_banner': instituteBanner,
      'has_more': hasMore,
      'courses': courseList.map((e) => e.toJson()).toList(),
    };
  }
}
