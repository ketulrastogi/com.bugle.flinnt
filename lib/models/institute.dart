class Institute {
  final String id;
  final String userPicture;

  final String userSchoolName;

  Institute({
    this.id,
    this.userPicture,
    this.userSchoolName,
  });

  factory Institute.fromJson(Map<String, dynamic> data) {
    return Institute(
      id: data['user_id'],
      userPicture: data['user_picture'],
      userSchoolName: data['user_school_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": id,
      "user_picture": userPicture,
      "user_school_name": userSchoolName,
    };
  }

  Institute copyWith({
    String id,
    String userPicture,
    String userSchoolName,
  }) {
    return Institute(
      id: id ?? this.id,
      userPicture: userPicture ?? this.userPicture,
      userSchoolName: userSchoolName ?? this.userSchoolName,
    );
  }
}
