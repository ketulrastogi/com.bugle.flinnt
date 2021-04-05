import 'package:flinnt/global/app_colors.dart';
import 'package:flinnt/ui/screens/register/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterScreenView extends StatelessWidget {
  const RegisterScreenView({Key key}) : super(key: key);

  static final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          appBar: AppBar(
            title: Text('Sign Up'),
          ),
          body: Form(
            key: _signUpFormKey,
            child: SingleChildScrollView(
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
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: white,
                        hintText: 'First Name',
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                      onSaved: (String value) => model.setFirstname(value),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Firstname must not be empty';
                        }
                        return null;
                      },
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
                      onSaved: (String value) => model.setLastname(value),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Lastname must not be empty';
                        }
                        return null;
                      },
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
                      onSaved: (String value) => model.setEmail(value),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Email must not be empty';
                        }
                        return null;
                      },
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
                      onSaved: (String value) => model.setPassword(value),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Password must not be empty';
                        }
                        return null;
                      },
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
                      onSaved: (String value) => model.setPassword(value),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Confirm Password must not be empty';
                          // } else if (value != model.password) {
                          //   return 'Password and Confirm Password are not same';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: ElevatedButton(
                      child: (model.isBusy)
                          ? Container(
                              height: 20.0,
                              width: 20.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () async {
                        if (_signUpFormKey.currentState.validate()) {
                          _signUpFormKey.currentState.save();
                          await model.signUp();
                          _signUpFormKey.currentState.reset();
                        } else {
                          print('Form not validated');
                        }
                      },
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
            ),
          ),
        );
      },
      viewModelBuilder: () => RegisterScreenViewModel(),
    );
  }
}
