import 'package:flinnt/models/course_section.dart';

class CourseContentListResponse {
  final String sectionCount;
  final String contentCount;
  final String hasMore;
  final Map<String, dynamic> service;
  final List<CourseSection> sections;

  CourseContentListResponse({
    this.sectionCount,
    this.contentCount,
    this.hasMore,
    this.service,
    this.sections,
  });

  factory CourseContentListResponse.fromJson(Map<String, dynamic> data) {
    return CourseContentListResponse(
      sectionCount: data['section_count'].toString(),
      contentCount: data['content_count'].toString(),
      hasMore: data['has_more'].toString(),
      service: data['service'],
      sections: [...data['list']]
          .map((item) => CourseSection.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'section_count': sectionCount,
      'content_count': contentCount,
      'has_more': hasMore,
      'service': service,
      'list': sections.map((item) => item.toJson()).toList(),
    };
  }
}
