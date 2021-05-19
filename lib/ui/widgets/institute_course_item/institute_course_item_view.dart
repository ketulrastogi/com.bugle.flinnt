import 'package:flinnt/global/app_colors.dart';
import 'package:flinnt/models/course.dart';
import 'package:flinnt/models/institute.dart';
import 'package:flinnt/ui/widgets/institute_course_item/institute_course_item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class InstituteCourseItemWidgetView extends StatelessWidget {
  final String coursePictureUrl;
  final String userPictureUrl;
  final String courseUserPictureUrl;
  final Course course;
  final Institute institute;
  const InstituteCourseItemWidgetView({
    Key key,
    this.course,
    this.institute,
    this.coursePictureUrl,
    this.userPictureUrl,
    this.courseUserPictureUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InstituteCourseItemWidgetViewModel>.reactive(
      builder: (context, model, child) {
        // print(course.toJson());
        return LayoutBuilder(
          builder: (context, constraints) {
            return InkWell(
              key: Key('$courseUserPictureUrl'),
              onTap: () => model.navigateToInstituteCourseDetailScreen(
                  institute, course),
              child: Card(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: constraints.maxHeight * 0.55,
                        width: constraints.maxWidth,
                        child: Image.network(
                          'http://via.placeholder.com/200x100',
                          // '${course.picture}',
                          fit: BoxFit.fill,
                        ),
                        // Image.network('$coursePictureUrl${course.picture}'),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                course.name,
                                style: Theme.of(context).textTheme.subtitle2,
                                textAlign: TextAlign.start,
                              ),
                              Container(
                                padding: EdgeInsets.all(4.0),
                                alignment: Alignment.bottomRight,
                                child: Text(
                                    course.public == '0' ? 'Private' : 'Public',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      viewModelBuilder: () => InstituteCourseItemWidgetViewModel(),
    );
  }
}
