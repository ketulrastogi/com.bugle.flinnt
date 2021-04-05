class AccountVerifyResendResponse {
  final String userAccountVerified;
  AccountVerifyResendResponse({
    this.userAccountVerified,
  });

  factory AccountVerifyResendResponse.fromJson(Map<String, dynamic> data) {
    return AccountVerifyResendResponse(
      userAccountVerified: data['user_acc_verified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_acc_verified': userAccountVerified,
    };
  }
}
