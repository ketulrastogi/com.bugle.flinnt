class UserProfile {
  final String firstName;
  final String lastName;
  final String instituteName;
  final String gender;
  final String birthDay;
  final String birthMonth;
  final String birthYear;
  final String city;
  final String email;
  final String mobile;

  UserProfile({
    this.firstName,
    this.lastName,
    this.instituteName,
    this.gender,
    this.birthDay,
    this.birthMonth,
    this.birthYear,
    this.city,
    this.email,
    this.mobile,
  });

  factory UserProfile.fromJson(Map<String, dynamic> data) {
    return UserProfile(
      firstName: data['first_name'],
      lastName: data['last_name'],
      instituteName: data['institute_name'],
      gender: data['gender'],
      birthDay: data['birth_day'],
      birthMonth: data['birth_month'],
      birthYear: data['birth_year'],
      city: data['city'],
      email: data['email'],
      mobile: data['mobile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'institute_name': instituteName,
      'gender': gender,
      'birth_day': birthDay,
      'birth_month': birthMonth,
      'birth_year': birthYear,
      'city': city,
      'email': email,
      'mobile': mobile,
    };
  }
}
