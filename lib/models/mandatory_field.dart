class MandatoryField {
  final int firstName;
  final int lastName;
  final int instituteName;
  final int gender;
  final int birthDay;
  final int birthMonth;
  final int birthYear;
  final int city;
  final int email;
  final int mobile;

  MandatoryField({
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

  factory MandatoryField.fromJson(Map<String, dynamic> data) {
    return MandatoryField(
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
