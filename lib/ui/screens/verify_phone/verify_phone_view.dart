import 'package:flinnt/global/app_colors.dart';
import 'package:flinnt/ui/screens/verify_phone/verify_phone_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class VerifyPhoneScreenView extends StatelessWidget {
  const VerifyPhoneScreenView({Key key}) : super(key: key);

  static final GlobalKey<FormState> _verifyPhoneFormKey =
      GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyPhoneScreenViewModel>.reactive(
      onModelReady: (model) async => await model.setUserLogin(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          appBar: AppBar(
            title: Text('Verify Mobile'),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _verifyPhoneFormKey,
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
                          '${model.userLogin}',
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
                        hintText: 'Verification Code',
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                      keyboardType: TextInputType.phone,
                      onSaved: (String value) =>
                          model.setVerificationCode(value),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Verification Code must not be empty';
                        } else if (value.length != 6) {
                          return 'Verification Code must be of 6 digits';
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
                      child: (model.busy('VerifyCode'))
                          ? Container(
                              height: 20.0,
                              width: 20.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Text('VERIFY'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () async {
                        if (_verifyPhoneFormKey.currentState.validate()) {
                          _verifyPhoneFormKey.currentState.save();
                          await model.verifyPhoneNumber();
                          _verifyPhoneFormKey.currentState.reset();
                        }
                      },
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
                  InkWell(
                    onTap: () async => await model.resendVerificationSMS(),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: [
                          Text(
                            'Did not recieve SMS? Try Again.',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          (model.busy('ResendSMS'))
                              ? Container(
                                  height: 20.0,
                                  width: 20.0,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3.0,
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: ElevatedButton(
                      child: (model.busy('VerifyStatus'))
                          ? Container(
                              height: 20.0,
                              width: 20.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Text('I\'VE ALREADY VERIFIED'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () async {
                        await model.verifyAccountStatus();
                      },
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
                      child: (model.busy('Logout'))
                          ? Container(
                              height: 20.0,
                              width: 20.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Text('LOGOUT'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () async => await model.logout(),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => VerifyPhoneScreenViewModel(),
    );
  }
}
