import 'package:flinnt/ui/screens/user_profile/user_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UserProfileScreenView extends StatelessWidget {
  const UserProfileScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
            actions: [
              IconButton(
                icon: Icon(Icons.done),
                onPressed: () {},
              ),
            ],
          ),
          body: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.8,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                  onSaved: (String value) => model.setUserFirstName(value),
                  validator: (String value) {},
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                  onSaved: (String value) => model.setUserLastName(value),
                  validator: (String value) {},
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Institute Name',
                  ),
                  onSaved: (String value) => model.setUserFirstName(value),
                  validator: (String value) {},
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                  ),
                  onSaved: (String value) => model.setUserGender(value),
                  validator: (String value) {},
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date Of Birth',
                  ),
                  onSaved: (String value) =>
                      model.setUserBirthdate(DateTime.parse(value)),
                  validator: (String value) {},
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'City',
                  ),
                  onSaved: (String value) => model.setUserCity(value),
                  validator: (String value) {},
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  onSaved: (String value) => model.setUserEmail(value),
                  validator: (String value) {},
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mobile No',
                  ),
                  onSaved: (String value) => model.setUserMobile(value),
                  validator: (String value) {},
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => UserProfileScreenViewModel(),
    );
  }
}
