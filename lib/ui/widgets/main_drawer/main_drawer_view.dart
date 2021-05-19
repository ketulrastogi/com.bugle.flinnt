import 'package:flinnt/global/app_colors.dart';
import 'package:flinnt/ui/widgets/main_drawer/main_drawer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MainDrawerWidgetView extends StatelessWidget {
  const MainDrawerWidgetView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainDrawerWidgetViewModel>.reactive(
      onModelReady: (model) async => await model.getUserDetails(),
      builder: (context, model, child) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.75, //20.0,
          child: Drawer(
              child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: Icon(
                  Icons.person,
                  size: 64.0,
                  color: white,
                ),
                arrowColor: white,
                onDetailsPressed: () => model.navigateToUserProfileScreen(),
                accountName: Text(
                    '${model.firstName ?? 'Guest'} ${model.lastName ?? ''}'),
                accountEmail: Text('${model.userLogin ?? ''}'),
              ),
              ListTile(
                leading: Icon(Icons.article),
                title: Text('My Courses'),
                onTap: () => model.navigateToUserHomeScreen(1),
              ),
              ListTile(
                leading: Icon(Icons.add_to_photos),
                title: Text('Join a Course'),
                onTap: () => model.navigateToJoinACourseScreen(),
              ),
              ListTile(
                leading: Icon(Icons.bookmarks),
                title: Text('My Wishlist'),
              ),
              ListTile(
                leading: Icon(Icons.approval),
                title: Text('User Requests'),
              ),
              ListTile(
                leading: Icon(Icons.home_work),
                title: Text('Select Institute'),
                onTap: () => model.navigateToInstituteListScreen(),
              ),
              ListTile(
                leading: Icon(Icons.star_rate),
                title: Text('Bookmarks'),
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
              ),
              ListTile(
                leading: Icon(Icons.warning),
                title: Text('Alerts'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('Contact Us'),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help'),
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () async => await model.logout(),
              ),
            ],
          )),
        );
      },
      viewModelBuilder: () => MainDrawerWidgetViewModel(),
    );
  }
}
