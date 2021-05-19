import 'package:flinnt/models/course.dart';
import 'package:flinnt/models/my_course_list_response.dart';
import 'package:flinnt/ui/widgets/my_course_item/my_course_item_view.dart';
import 'package:flinnt/ui/widgets/my_course_list/my_course_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MyCourseListWidgetView extends StatelessWidget {
  const MyCourseListWidgetView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyCourseListWidgetViewModel>.reactive(
      onModelReady: (model) async => await model.getMyCourse(),
      builder: (context, model, child) {
        return (model.isBusy)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (model.courseList.length > 0)
                ? GridView.builder(
                    padding: EdgeInsets.all(16.0),
                    itemCount: model.courseList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.88,
                    ),
                    itemBuilder: (context, index) {
                      Course course = model.courseList[index];
                      return MyCourseItemWidgetView(
                        course: course,
                        coursePictureUrl: model.courseList[index].picture,
                        userPictureUrl: model.courseList[index].userPicture,
                        courseUserPictureUrl:
                            model.courseList[index].courseUserPicture,
                      );
                    },
                  )
                : Center(
                    child: Text('No courses found.'),
                  );
      },
      viewModelBuilder: () => MyCourseListWidgetViewModel(),
    );
  }
}
