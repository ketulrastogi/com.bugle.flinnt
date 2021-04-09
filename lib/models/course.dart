class Course {
  final String id;
  final String name;
  final String picture;
  final String userPicture;
  final String price;
  final String ownerName;
  final String isFree;
  final String status;
  final String userModRoleId;
  final String courseUserPicture;
  final String planExpired;
  final String statTotalView;
  final String statTotalPosts;
  final String courseCommunity;
  final String totalUsers;
  final String publicType;
  final String eventDateTime;
  final String userSchoolName;
  final String unreadPost;
  final String allowMute;
  final String allowInviteUsers;
  final String allowChangeSettings;
  final String allowRateCourse;
  final String allowUnsubscribe;
  final String allowedRoles;
  final String allowCourseInfo;

  Course({
    this.id,
    this.name,
    this.picture,
    this.userPicture,
    this.price,
    this.ownerName,
    this.isFree,
    this.status,
    this.userModRoleId,
    this.courseUserPicture,
    this.planExpired,
    this.statTotalPosts,
    this.statTotalView,
    this.courseCommunity,
    this.totalUsers,
    this.publicType,
    this.eventDateTime,
    this.userSchoolName,
    this.unreadPost,
    this.allowMute,
    this.allowInviteUsers,
    this.allowChangeSettings,
    this.allowRateCourse,
    this.allowUnsubscribe,
    this.allowedRoles,
    this.allowCourseInfo,
  });

  factory Course.fromJson(Map<String, dynamic> data) {
    return Course(
      id: data['course_id'],
      name: data['course_name'],
      picture: data['course_picture'],
      userPicture: data['user_picture'],
      price: data['course_price'],
      ownerName: data['course_owner_name'],
      isFree: data['course_is_free'],
      status: data['course_status'],
      userModRoleId: data['user_mod_role_id'],
      courseUserPicture: data['course_user_picture'],
      planExpired: data['course_plan_expired'],
      statTotalPosts: data['stat_total_posts'],
      statTotalView: data['stat_total_view'],
      courseCommunity: data['course_community'],
      totalUsers: data['total_users'],
      publicType: data['public_type'],
      eventDateTime: data['event_datetime'],
      userSchoolName: data['user_school_name'],
      unreadPost: data['unread_post'],
      allowMute: data['allow_mute'],
      allowInviteUsers: data['allow_invite_users'],
      allowChangeSettings: data['allow_change_settings'],
      allowRateCourse: data['allow_rate_course'],
      allowUnsubscribe: data['allow_unsubscribe'],
      allowedRoles: data['allowed_roles'],
      allowCourseInfo: data['allow_course_info'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "course_id": id,
      "course_name": name,
      "course_picture": picture,
      "user_picture": userPicture,
      "course_price": price,
      "course_owner_name": ownerName,
      "course_is_free": isFree,
      "course_status": status,
      "user_mod_role_id": userModRoleId,
      "course_user_picture": courseUserPicture,
      "course_plan_expired": planExpired,
      "stat_total_posts": statTotalPosts,
      "stat_total_view": statTotalView,
      "course_community": courseCommunity,
      "total_users": totalUsers,
      "public_type": publicType,
      "event_datetime": eventDateTime,
      "user_school_name": userSchoolName,
      "unread_post": unreadPost,
      "allow_mute": allowMute,
      "allow_invite_users": allowInviteUsers,
      "allow_change_settings": allowChangeSettings,
      "allow_rate_course": allowRateCourse,
      "allow_unsubscribe": allowUnsubscribe,
      "allowed_roles": allowedRoles,
      "allow_course_info": allowCourseInfo,
    };
  }
}
