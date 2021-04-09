import 'package:flinnt/global/app_colors.dart';
import 'package:flinnt/ui/screens/course_content_detail/course_content_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CourseContentDetailScreenView extends StatelessWidget {
  const CourseContentDetailScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CourseContentDetailScreenViewModel>.reactive(
      onModelReady: (model) => model.setYoutubePlayerController('5isPWNr_Jqs'),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Content Title',
              overflow: TextOverflow.fade,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text('Prastavana'),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: YoutubePlayerControllerProvider(
                  // Provides controller to all the widget below it.
                  controller: model.controller,
                  child: YoutubePlayerIFrame(
                      // aspectRatio: 16 / 9,
                      ),
                ),
              ),
              Container(
                child: Center(
                  child: Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(32.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                            ),
                          ]),
                      child: IconButton(
                          icon: Icon(Icons.thumb_up), onPressed: () {})),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text('1 Viewer'),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.thumb_up_sharp),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text('0 Likes'),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.comment),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text('0 Comments'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      minRadius: 24.0,
                      maxRadius: 24.0,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Icon(
                        Icons.person,
                        color: white,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(32.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                            ),
                          ]),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text('Comments'),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    size: 32.0,
                    color: white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => CourseContentDetailScreenViewModel(),
    );
  }
}
