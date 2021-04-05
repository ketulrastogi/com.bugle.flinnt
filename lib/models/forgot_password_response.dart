class ForgotPasswordResponse {
  final String userAccountVerified;

  ForgotPasswordResponse({
    this.userAccountVerified,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> data) {
    return ForgotPasswordResponse(
      userAccountVerified: data['user_acc_verified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_acc_verified': userAccountVerified,
    };
  }
}
