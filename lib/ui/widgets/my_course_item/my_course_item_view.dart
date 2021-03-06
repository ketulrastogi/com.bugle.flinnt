import 'package:flinnt/global/app_colors.dart';
import 'package:flinnt/models/course.dart';
import 'package:flinnt/ui/widgets/my_course_item/my_course_item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MyCourseItemWidgetView extends StatelessWidget {
  final String coursePictureUrl;
  final String userPictureUrl;
  final String courseUserPictureUrl;
  final Course course;
  const MyCourseItemWidgetView({
    Key key,
    this.course,
    this.coursePictureUrl,
    this.userPictureUrl,
    this.courseUserPictureUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyCourseItemWidgetViewModel>.reactive(
      builder: (context, model, child) {
        // print(course.toJson());
        return LayoutBuilder(
          builder: (context, constraints) {
            return InkWell(
              key: Key('$courseUserPictureUrl'),
              onTap: () => model.navigateToCourseContentListScreen(course),
              child: Card(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: constraints.maxHeight * 0.45,
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
                            children: [
                              Text(
                                course.name,
                                style: Theme.of(context).textTheme.bodyText2,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                'by ${course.userSchoolName}',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      color: textDarkGrey,
                                    ),
                                textAlign: TextAlign.start,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Users: ${course.totalUsers}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(
                                            color: bodyTextDarkColor,
                                          ),
                                    ),
                                    Icon(Icons.more_vert),
                                  ],
                                ),
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
      viewModelBuilder: () => MyCourseItemWidgetViewModel(),
    );
  }
}
