import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flinnt/global/app_colors.dart';
import 'package:flinnt/ui/screens/user_profile/user_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class UserProfileScreenView extends StatelessWidget {
  UserProfileScreenView({Key key}) : super(key: key);

  final GlobalKey<FormState> _accountProfileFormKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _instituteNameController =
      TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileScreenViewModel>.reactive(
      onModelReady: (model) async {
        await model.loadUserData();
        _firstNameController.text = model.userProfile.firstName;
        _lastNameController.text = model.userProfile.lastName;
        _instituteNameController.text = model.userProfile.instituteName;
        _genderController.text = model.userProfile.gender;
        _cityController.text = model.userProfile.city;
        _emailController.text = model.userProfile.email;
        _mobileController.text = model.userProfile.mobile;
        model.setUserBirthdate((model.userProfile.birthDay.toString() == '0' ||
                model.userProfile.birthMonth.toString() == '0' ||
                model.userProfile.birthYear.toString() == '0')
            ? null
            : DateFormat('dd-MM-yyyy').parse(
                '${model.userProfile.birthDay}-${model.userProfile.birthMonth}-${model.userProfile.birthYear}'));
        _birthdateController.text =
            '${model.userProfile.birthDay}-${model.userProfile.birthMonth}-${model.userProfile.birthYear}';
        model.setUserGender(model.userProfile.gender);
        // model.setUserGender(model.userProfile.email);
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
            actions: [
              IconButton(
                icon: Icon(Icons.done),
                onPressed: () async {
                  if (_accountProfileFormKey.currentState.validate()) {
                    _accountProfileFormKey.currentState.save();
                    print('FormValidated');
                    await model.updateUserAccountProfile();
                  } else {
                    print('FormNotValidated');
                  }
                },
              ),
            ],
          ),
          body: (model.isBusy)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  key: _accountProfileFormKey,
                  child: ListView(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2.8,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 128.0,
                                    width: 128.0,
                                    padding: EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(48.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(32.0),
                                      child: Image.asset(
                                        'assets/images/default_user_profile_image.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 16,
                                    right: 16,
                                    child: Container(
                                      padding: EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.edit,
                                          size: 18.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                '${model.userProfile?.firstName ?? ''} ${model.userProfile?.lastName ?? ''}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: white,
                                    ),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                '${model.userLogin ?? ''}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller: _firstNameController,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(),
                          ),
                          onSaved: (String value) =>
                              model.setUserFirstName(value),
                          validator: (String value) {
                            if (model.mandatoryField.firstName == 1 &&
                                value.isEmpty) {
                              return 'First Name can not be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller: _lastNameController,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(),
                          ),
                          onSaved: (String value) =>
                              model.setUserLastName(value),
                          validator: (String value) {
                            if (model.mandatoryField.lastName == 1 &&
                                value.isEmpty) {
                              return 'Last Name can not be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller: _instituteNameController,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Institute Name',
                            labelStyle: TextStyle(),
                          ),
                          onSaved: (String value) =>
                              model.setUserInstituteName(value),
                          validator: (String value) {
                            if (model.mandatoryField.instituteName == 1 &&
                                value.isEmpty) {
                              return 'Institute Name can not be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButtonFormField<String>(
                          // value: model.gender,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Gender',
                            labelStyle: TextStyle(),
                          ),
                          onChanged: (String value) {
                            print(value);
                            model.setUserGender(value);
                          },
                          onSaved: (String value) {
                            print(value);
                            model.setUserGender(value);
                          },
                          validator: (String value) {
                            if (model.mandatoryField.gender == 1 &&
                                value.isEmpty) {
                              return 'Gender can not be empty';
                            }
                            return null;
                          },
                          items: ['Male', 'Female']
                              .map((gender) => DropdownMenuItem<String>(
                                    child: Text('$gender'),
                                    value: '$gender',
                                    onTap: () {
                                      model.setUserGender('$gender');
                                    },
                                  ))
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: DateTimeField(
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          initialValue: model.birthDate,
                          controller: _birthdateController,
                          format: DateFormat("dd-MMM-yyyy"),
                          decoration: InputDecoration(
                            labelText: 'Date Of Birth',
                            labelStyle: TextStyle(),
                          ),
                          onChanged: (DateTime value) {
                            model.setUserBirthdate(value);
                          },
                          validator: (DateTime value) {
                            if (model.mandatoryField.instituteName == 1 &&
                                    value == null ||
                                value.day.toString() == '0') {
                              return 'Institute Name can not be empty';
                            }
                            return null;
                          },
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller: _cityController,
                          decoration: InputDecoration(
                            labelText: 'City',
                            labelStyle: TextStyle(),
                          ),
                          onSaved: (String value) => model.setUserCity(value),
                          validator: (String value) {
                            if (model.mandatoryField.city == 1 &&
                                value.isEmpty) {
                              return 'City Name can not be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller: _emailController,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(),
                          ),
                          onSaved: (String value) => model.setUserEmail(value),
                          validator: (String value) {
                            if (model.mandatoryField.email == 1 &&
                                value.isEmpty) {
                              return 'Email can not be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller: _mobileController,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Mobile No',
                            labelStyle: TextStyle(),
                          ),
                          onSaved: (String value) => model.setUserMobile(value),
                          validator: (String value) {
                            if (model.mandatoryField.mobile == 1 &&
                                value.isEmpty) {
                              return 'Mobile Number can not be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
      viewModelBuilder: () => UserProfileScreenViewModel(),
    );
  }
}
