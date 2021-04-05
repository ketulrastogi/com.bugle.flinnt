class User {
  final String userId;
  final String userLogin;
  final String firstName;
  final String lastName;
  final String userIsActive;
  final String userPicture;
  final String userAccountVerified;
  final String userAccountAuthMode;
  final int canAdd;
  final String userAccountClosed;
  final String birthDay;
  final String birthMonth;
  final String birthYear;
  final String userGender;
  final String userPictureUrl;
  final int canBrowseCourse;

  User({
    this.userId,
    this.userLogin,
    this.firstName,
    this.lastName,
    this.userIsActive,
    this.userPicture,
    this.userAccountVerified,
    this.userAccountAuthMode,
    this.canAdd,
    this.userAccountClosed,
    this.birthDay,
    this.birthMonth,
    this.birthYear,
    this.userGender,
    this.userPictureUrl,
    this.canBrowseCourse,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      userId: data['user_id'],
      userLogin: data['user_login'],
      firstName: data['firstname'],
      lastName: data['lastname'],
      userIsActive: data['user_is_active'],
      userPicture: data['user_picture'],
      userAccountVerified: data['user_acc_verified'],
      userAccountAuthMode: data['user_acc_auth_mode'],
      canAdd: data['can_add'],
      userAccountClosed: data['user_acc_closed'],
      birthDay: data['birth_day'],
      birthMonth: data['birth_month'],
      birthYear: data['birth_year'],
      userGender: data['user_gender'],
      userPictureUrl: data['user_picture_url'],
      canBrowseCourse: data['can_browse_course'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_login': userLogin,
      'firstname': firstName,
      'lastname': lastName,
      'user_is_active': userIsActive,
      'user_picture': userPicture,
      'user_acc_verified': userAccountVerified,
      'user_acc_auth_mode': userAccountAuthMode,
      'can_add': canAdd,
      'user_acc_closed': userAccountClosed,
      'birth_day': birthDay,
      'birth_month': birthMonth,
      'birth_year': birthYear,
      'user_gender': userGender,
      'user_picture_url': userPictureUrl,
      'can_browse_course': canBrowseCourse,
    };
  }
}
