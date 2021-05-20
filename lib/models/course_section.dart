import 'package:flinnt/models/course_section_content.dart';

class CourseSection {
  final String type;
  final String id;
  final String title;
  final List<CourseSectionContent> contents;

  CourseSection({
    this.type,
    this.id,
    this.title,
    this.contents,
  });

  factory CourseSection.fromJson(Map<String, dynamic> data) {
    return CourseSection(
      type: data['type'],
      id: data['id'],
      title: data['title'],
      contents: [...data['contents']]
          .map((item) => CourseSectionContent.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'title': title,
      'contents': contents.map((item) => item.toJson()).toList(),
    };
  }
}
