import 'package:flinnt/global/constants.dart';
import 'package:flinnt/ui/screens/register/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterScreenView extends StatelessWidget {
  const RegisterScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          appBar: AppBar(
            title: Text('Sign Up'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  height: 128.0,
                  child: Image.asset(
                    'assets/images/flinnt-logo-white-354x121.png',
                    color: Theme.of(context).primaryColor,
                    scale: 2.5,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: white,
                    hintText: 'First Name',
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: white,
                    hintText: 'Last Name',
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: white,
                    hintText: 'Email/Mobile',
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: white,
                    hintText: 'Password',
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: white,
                    hintText: 'Confirm Password',
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: ElevatedButton(
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () => null,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Center(
                child: Text(
                  'By clicking submit, you agree to our Terms and Conditions.',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => RegisterScreenViewModel(),
    );
  }
}
