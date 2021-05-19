import 'package:flinnt/models/institute.dart';

class InstituteListResponse {
  final String userPictureUrl;
  final int hasMore;
  final List<Institute> instituteList;

  InstituteListResponse({
    this.userPictureUrl,
    this.hasMore,
    this.instituteList,
  });

  factory InstituteListResponse.fromJson(Map<String, dynamic> data) {
    return InstituteListResponse(
      userPictureUrl: data['user_picture_url'],
      hasMore: data['has_more'],
      instituteList: [...data['institutions']]
          .map((item) => Institute.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_picture_url': userPictureUrl,
      'has_more': hasMore,
      'institutions': instituteList.map((e) => e.toJson()).toList(),
    };
  }
}
