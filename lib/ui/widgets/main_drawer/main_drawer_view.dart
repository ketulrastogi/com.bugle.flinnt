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
