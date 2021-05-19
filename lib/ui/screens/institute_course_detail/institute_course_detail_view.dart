import 'package:cached_network_image/cached_network_image.dart';
import 'package:flinnt/models/course.dart';
import 'package:flinnt/models/institute.dart';
import 'package:flinnt/ui/screens/institute_course_detail/institute_course_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

class InstituteCourseDetailScreenView extends StatelessWidget {
  final Institute institute;
  final Course course;
  const InstituteCourseDetailScreenView({Key key, this.institute, this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InstituteCourseDetailScreenViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('${course?.name ?? ''}'),
        ),
        body: ListView(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${course.name}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 6.0),
                        Text('${institute.userSchoolName}'),
                        SizedBox(height: 6.0),
                        Row(
                          children: [
                            Container(
                              height: 24.0,
                              child: RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20.0,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Text('0 Ratings'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 200.0,
                    padding: EdgeInsets.only(right: 16.0),
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0)),
                      child: (model.busy('SendRequestToJoinCourse'))
                          ? Container(
                              height: 40.0,
                              width: 88.0,
                              // padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                            )
                          : Text(
                              'SEND REQUEST \nTO JOIN',
                              textAlign: TextAlign.center,
                            ),
                      onPressed: () async =>
                          await model.sendRequestToJoinCourse(course),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Reviews',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Divider(height: 2.0),
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(
                      'Maurya Patel',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 16.0,
                            // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ),
                        Text(
                          'Nice thoughts',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    trailing: Text(
                      '20 APR 2015',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => InstituteCourseDetailScreenViewModel(),
    );
  }
}
