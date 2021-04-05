import 'package:flinnt/global/app_colors.dart';
import 'package:flinnt/ui/screens/forgot_password/forgot_password_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordScreenView extends StatelessWidget {
  const ForgotPasswordScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordScreenViewModel>.reactive(
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
              SizedBox(
                height: 16.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text('Enter your username below to reset your password'),
              ),
              SizedBox(
                height: 16.0,
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
            ],
          ),
        );
      },
      viewModelBuilder: () => ForgotPasswordScreenViewModel(),
    );
  }
}
