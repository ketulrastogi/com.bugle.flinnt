import 'package:flinnt/global/app_colors.dart';
import 'package:flinnt/ui/screens/verify_email/verify_email_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class VerifyEmailScreenView extends StatelessWidget {
  const VerifyEmailScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyEmailScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          appBar: AppBar(
            title: Text('Verify Email'),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('We have sent a verification link on email:'),
                      Text(
                        'ketul@bugletech.com',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text('Click on the link to verify you email.'),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Did not recieve Email? Try Again.',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: ElevatedButton(
                    child: Text('I\'VE ALREADY VERIFIED'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () async {},
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'For help call: 0-79-4014-9800.',
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Center(
                    child: Text(
                      'By verifying account, you agree to our Terms and Conditions.',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: ElevatedButton(
                    child: Text('LOGOUT'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () async {},
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => VerifyEmailScreenViewModel(),
    );
  }
}
