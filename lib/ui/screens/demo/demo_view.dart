import 'package:flinnt/ui/screens/demo/demo_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DemoScreenView extends StatelessWidget {
  const DemoScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DemoScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Go to Login'),
                  style: ButtonStyle(),
                  onPressed: () => model.navigateToLoginScreen(),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  child: Text('Go to Register'),
                  style: ButtonStyle(),
                  onPressed: () => model.navigateToRegisterScreen(),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  child: Text('Go to Forgot Password'),
                  style: ButtonStyle(),
                  onPressed: () => model.navigateToForgotPasswordScreen(),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  child: Text('Verify Email'),
                  style: ButtonStyle(),
                  onPressed: () => model.navigateToVerifyEmailScreen(),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  child: Text('Verify Phone'),
                  style: ButtonStyle(),
                  onPressed: () => model.navigateToVerifyPhoneScreen(),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  child: Text('Go to Home'),
                  style: ButtonStyle(),
                  onPressed: () => model.navigateToHomeScreen(),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => DemoScreenViewModel(),
    );
  }
}
