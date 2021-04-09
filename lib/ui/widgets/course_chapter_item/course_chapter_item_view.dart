import 'package:flinnt/ui/widgets/course_chapter_item/course_chapter_item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CourseChapterItemWidgetView extends StatelessWidget {
  const CourseChapterItemWidgetView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Text('Chalo Itihas Janiye'),
              ),
              Container(
                child: ListView.separated(
                  padding: EdgeInsets.all(16.0),
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => model.navigateToCourseContentDetailScreen(),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Prastavana'),
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
