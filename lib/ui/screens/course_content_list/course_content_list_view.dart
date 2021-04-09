import 'package:flinnt/models/course.dart';
import 'package:flinnt/ui/screens/course_content_list/course_content_list_viewmodel.dart';
import 'package:flinnt/ui/widgets/course_chapter_item/course_chapter_item_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CourseContentListScreenView extends StatelessWidget {
  // final Course course;
  // const CourseContentListScreenView({Key key, this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CourseContentListScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'course.name',
              overflow: TextOverflow.fade,
            ),
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    // '${course.picture}',
                    'https://online.stanford.edu/sites/default/files/styles/figure_default/public/2018-03/education-creating-effective-online-blended-courses_gse-yo.p.e.n.jpg?itok=QUn6gWp5',
                    fit: BoxFit.cover,
                  ),
                ),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CourseChapterItemWidgetView();
                  },
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => CourseContentListScreenViewModel(),
    );
  }
}
