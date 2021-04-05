import 'package:flinnt/global/app_colors.dart';
import 'package:flinnt/ui/screens/verify_phone/verify_phone_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class VerifyPhoneScreenView extends StatelessWidget {
  const VerifyPhoneScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyPhoneScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          appBar: AppBar(
            title: Text('Verify Mobile'),
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
                      Text('We have sent a verification code on mobile no:'),
                      Text(
                        '9876543210',
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
                  child: Text('Enter the code below and click to verify.'),
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
                    // onSaved: (String value) => model.setUsername(value),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Username must not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: ElevatedButton(
                    child: Text('VERIFY'),
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
                  child: Center(
                    child: Text(
                      'By verifying account, you agree to our Terms and Conditions.',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Please note that SMS delivery can take a minute or more.',
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Did not recieve SMS? Try Again.',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
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
                  height: 24.0,
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
      viewModelBuilder: () => VerifyPhoneScreenViewModel(),
    );
  }
}
