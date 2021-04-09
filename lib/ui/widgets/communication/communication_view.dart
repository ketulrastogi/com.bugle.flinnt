import 'package:carousel_slider/carousel_slider.dart';
import 'package:flinnt/ui/widgets/communication/communication_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CommunicationWidgetView extends StatelessWidget {
  const CommunicationWidgetView({Key key}) : super(key: key);
  static final GlobalKey carouselKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommunicationWidgetViewModel>.reactive(
      builder: (context, model, child) {
        return ListView(
          children: [
            SizedBox(
              height: 8.0,
            ),
            Container(
              height: 200,
              child: CarouselSlider(
                key: carouselKey,
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.98,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
                items: model.urls.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin:
                            EdgeInsets.only(left: 4.0, right: 4.0, bottom: 8.0),
                        child: Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            // margin: EdgeInsets.symmetric(horizontal: 5.0),
                            // decoration: BoxDecoration(color: Colors.amber),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Image.network(
                                  url,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            ListView.builder(
              padding: EdgeInsets.all(8.0),
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Class 9 Science',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                'April 22,2020',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('Do you really know your planet?'),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Container(
                          height: 128.0,
                          child: Image.network(
                            'https://img.theweek.in/content/dam/week/news/sci-tech/images/2019/4/22/earth_day.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                              'Today is Earth Day, so are you ready for an earthy challange? Take this quiz which is based on earth and try to score 11/11.'),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Let\'s Play'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(4.0),
                                bottomRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
      viewModelBuilder: () => CommunicationWidgetViewModel(),
    );
  }
}
