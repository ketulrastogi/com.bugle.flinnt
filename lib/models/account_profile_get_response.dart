import 'package:flinnt/models/mandatory_field.dart';
import 'package:flinnt/models/user_profile.dart';

class AccountProfileGetResponse {
  final List<UserProfile> profileList;
  final MandatoryField mandatory;

  AccountProfileGetResponse({
    this.profileList,
    this.mandatory,
  });

  factory AccountProfileGetResponse.fromJson(Map<String, dynamic> data) {
    return AccountProfileGetResponse(
      profileList: [...data['profile']]
          .map((item) => UserProfile.fromJson(item))
          .toList(),
      mandatory: MandatoryField.fromJson(data['mandatory']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profile': profileList.map((item) => item.toJson()).toList(),
      'mandatory': mandatory.toJson(),
    };
  }
}
