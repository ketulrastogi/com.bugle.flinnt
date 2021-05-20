class CourseSectionContent {
  final String type;
  final String id;
  final String title;
  final String viewed;
  final String preview;
  final Map<String, dynamic> statistics;

  CourseSectionContent({
    this.type,
    this.id,
    this.title,
    this.viewed,
    this.preview,
    this.statistics,
  });

  factory CourseSectionContent.fromJson(Map<String, dynamic> data) {
    return CourseSectionContent(
      // type: data['type'],
      id: data['id'],
      title: data['title'],
      // viewed: data['viewed'],
      // preview: data['preview'],
      // statistics: data['statistics'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'title': title,
      'viewed': viewed,
      'preview': preview,
      'statistics': statistics,
    };
  }
}
