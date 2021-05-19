import 'package:flinnt/ui/screens/join_a_course/join_a_course_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class JoinACourseScreenView extends StatelessWidget {
  const JoinACourseScreenView({Key key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JoinACourseScreenViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Join a Course'),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 32.0,
                ),
                Text(
                    'Enter a 6-digit course code you have obtained from your institute.'),
                SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Course Code',
                    labelText: 'Course Code',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Course Code can not be empty';
                    } else if (value.length != 6) {
                      return 'Course Code must be of 6 digits.';
                    }
                    return null;
                  },
                  onSaved: (String value) => model.setCourseCode(value),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  child: Text('JOIN'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      model.joinCourse();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => JoinACourseScreenViewModel(),
    );
  }
}
