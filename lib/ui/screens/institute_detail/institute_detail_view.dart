import 'package:cached_network_image/cached_network_image.dart';
import 'package:flinnt/models/course.dart';
import 'package:flinnt/models/institute.dart';
import 'package:flinnt/ui/screens/institute_detail/institute_detail_viewmodel.dart';
import 'package:flinnt/ui/widgets/institute_course_item/institute_course_item_view.dart';
import 'package:flinnt/ui/widgets/my_course_item/my_course_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

class InstituteDetailScreenView extends StatelessWidget {
  final Institute institute;
  const InstituteDetailScreenView({Key key, this.institute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InstituteDetailScreenViewModel>.reactive(
      onModelReady: (model) async =>
          await model.getInstituteCourseList(institute),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('${institute?.userSchoolName ?? ''}'),
        ),
        body: (model.isBusy)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Container(
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: 'http://via.placeholder.com/350x150',
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      '${institute.userSchoolName}',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  Container(
                    child: (model.courseList.length > 0)
                        ? GridView.builder(
                            padding: EdgeInsets.all(16.0),
                            itemCount: model.courseList.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              // childAspectRatio: 0.95,
                            ),
                            itemBuilder: (context, index) {
                              Course course = model.courseList[index];
                              return InstituteCourseItemWidgetView(
                                institute: institute,
                                course: course,
                                coursePictureUrl:
                                    model.courseList[index].picture,
                                userPictureUrl:
                                    model.courseList[index].userPicture,
                                courseUserPictureUrl:
                                    model.courseList[index].courseUserPicture,
                              );
                            },
                          )
                        : Center(
                            child: Text('No courses found.'),
                          ),
                  ),
                ],
              ),
      ),
      viewModelBuilder: () => InstituteDetailScreenViewModel(),
    );
  }
}
