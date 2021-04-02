import 'package:flinnt/global/constants.dart';
import 'package:flinnt/ui/screens/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          appBar: AppBar(
            title: Text('Login'),
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
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                alignment: Alignment.centerRight,
                child: Text('Forgot password?'),
              ),
              SizedBox(
                height: 32.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: ElevatedButton(
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () => null,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: ElevatedButton(
                  child: Text(
                    'New User? Sign Up',
                    style: Theme.of(context).textTheme.button.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    primary: white,
                    elevation: 1.0,
                  ),
                  onPressed: () => null,
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => LoginScreenViewModel(),
    );
  }
}
