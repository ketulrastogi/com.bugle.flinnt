class SignUpResponse {
  final String userId;
  final String userLogin;
  final String userAccountVerified;
  final String userAccountAuthMode;

  SignUpResponse({
    this.userId,
    this.userLogin,
    this.userAccountVerified,
    this.userAccountAuthMode,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> data) {
    return SignUpResponse(
      userId: data['user_id'],
      userLogin: data['user_login'],
      userAccountVerified: data['user_acc_verified'],
      userAccountAuthMode: data['user_acc_auth_mode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_login': userLogin,
      'user_acc_verified': userAccountVerified,
      'user_acc_auth_mode': userAccountAuthMode,
    };
  }
}
