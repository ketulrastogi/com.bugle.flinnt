import 'package:flinnt/models/course.dart';
import 'package:flinnt/models/course_section.dart';
import 'package:flinnt/models/course_section_content.dart';
import 'package:flinnt/ui/widgets/course_chapter_item/course_chapter_item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CourseChapterItemWidgetView extends StatelessWidget {
  final Course course;
  final CourseSection courseSection;
  const CourseChapterItemWidgetView({Key key, this.courseSection, this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('14 - CourseSection : ${courseSection.toJson()}}');
    return ViewModelBuilder<CourseChapterItemWidgetViewModel>.reactive(
      builder: (context, model, child) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                child: Text(courseSection.title),
              ),
              Container(
                child: ListView.separated(
                  padding: EdgeInsets.all(16.0),
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: courseSection.contents.length,
                  itemBuilder: (context, index) {
                    CourseSectionContent courseSectionContent =
                        courseSection.contents[index];

                    return InkWell(
                      onTap: () => model.navigateToCourseContentDetailScreen(
                          course, courseSectionContent),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(courseSectionContent.title),
                            Row(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.thumb_up,
                                        size: 20.0,
                                      ),
                                      SizedBox(
                                        width: 4.0,
                                      ),
                                      Text('0 Likes'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.message,
                                        size: 20.0,
                                      ),
                                      SizedBox(
                                        width: 4.0,
                                      ),
                                      Text('0 comments'),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(Icons.play_circle_fill),
                                  onPressed: () {},
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => CourseChapterItemWidgetViewModel(),
    );
  }
}
