import 'package:flinnt/models/course_section.dart';

class CourseContentListResponse {
  final int sectionCount;
  final int contentCount;
  final int hasMore;
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
      sectionCount: data['section_count'],
      contentCount: data['content_count'],
      hasMore: data['has_more'],
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
