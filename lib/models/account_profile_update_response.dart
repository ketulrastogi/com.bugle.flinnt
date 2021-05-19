class AccountProfileUpdateResponse {
  final int updated;
  final String userPictureUrl;
  final String userPicture;
  final AccountProfileEmail accountProfileEmail;
  final AccountProfileMobile accountProfileMobile;

  AccountProfileUpdateResponse({
    this.updated,
    this.userPictureUrl,
    this.userPicture,
    this.accountProfileEmail,
    this.accountProfileMobile,
  });

  factory AccountProfileUpdateResponse.fromJson(Map<String, dynamic> data) {
    return AccountProfileUpdateResponse(
      updated: data['updated'],
      userPictureUrl: data['user_picture_url'],
      userPicture: data['user_picture'],
      accountProfileEmail: AccountProfileEmail.fromJson(data['email']),
      accountProfileMobile: AccountProfileMobile.fromJson(data['mobile_no']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'updated': updated,
      'user_picture_url': userPictureUrl,
      'user_picture': userPicture,
      'email': accountProfileEmail.toJson(),
      'mobile_no': accountProfileMobile.toJson(),
    };
  }
}

class AccountProfileEmail {
  final int verifyEmail;
  final String email;
  final String verificationId;

  AccountProfileEmail({
    this.verifyEmail,
    this.email,
    this.verificationId,
  });

  factory AccountProfileEmail.fromJson(Map<String, dynamic> data) {
    return AccountProfileEmail(
      verifyEmail: data['verify_email'],
      email: data['email'],
      verificationId: data['verification_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'verify_email': verifyEmail,
      'email': email,
      'verification_id': verificationId,
    };
  }
}

class AccountProfileMobile {
  final int verifyMobile;
  final String mobile;
  final String verificationId;

  AccountProfileMobile({
    this.verifyMobile,
    this.mobile,
    this.verificationId,
  });

  factory AccountProfileMobile.fromJson(Map<String, dynamic> data) {
    return AccountProfileMobile(
      verifyMobile: data['verify_mobile'],
      mobile: data['mobile'],
      verificationId: data['verification_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'verify_mobile': verifyMobile,
      'mobile': mobile,
      'verification_id': verificationId,
    };
  }
}
