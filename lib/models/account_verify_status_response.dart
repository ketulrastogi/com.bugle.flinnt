class AccountVerifyStatusResponse {
  final String userAccountVerified;

  AccountVerifyStatusResponse({
    this.userAccountVerified,
  });

  factory AccountVerifyStatusResponse.fromJson(Map<String, dynamic> data) {
    return AccountVerifyStatusResponse(
      userAccountVerified: data['user_acc_verified'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_acc_verified': userAccountVerified,
    };
  }
}
