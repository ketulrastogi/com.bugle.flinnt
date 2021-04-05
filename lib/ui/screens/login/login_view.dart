import 'package:flinnt/global/app_colors.dart';
import 'package:flinnt/ui/screens/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({Key key}) : super(key: key);

  static final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          appBar: AppBar(
            title: Text('Login'),
            automaticallyImplyLeading: false,
          ),
          body: Form(
            key: _signInFormKey,
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
                        hintText: 'Email/Mobile',
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                      onSaved: (String value) => model.setUsername(value),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Email/Mobile must not be empty';
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
                      obscureText: true,
                      onSaved: (String value) => model.setPassword(value),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Password must not be empty';
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
                    alignment: Alignment.centerRight,
                    child: Text('Forgot password?'),
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
                          : Text('Login'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () async {
                        if (_signInFormKey.currentState.validate()) {
                          _signInFormKey.currentState.save();
                          await model.signIn();
                          _signInFormKey.currentState.reset();
                        }
                      },
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
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginScreenViewModel(),
    );
  }
}
