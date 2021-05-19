import 'package:flinnt/services/auth.dart';
import 'package:flinnt/services/course.dart';
import 'package:flinnt/services/institute.dart';
import 'package:flinnt/services/local_data.dart';
import 'package:flinnt/services/user.dart';
import 'package:flinnt/ui/screens/course_content_detail/course_content_detail_view.dart';
import 'package:flinnt/ui/screens/course_content_list/course_content_list_view.dart';
import 'package:flinnt/ui/screens/demo/demo_view.dart';
import 'package:flinnt/ui/screens/forgot_password/forgot_password_view.dart';
import 'package:flinnt/ui/screens/home/home_view.dart';
import 'package:flinnt/ui/screens/institute_course_detail/institute_course_detail_view.dart';
import 'package:flinnt/ui/screens/institute_detail/institute_detail_view.dart';
import 'package:flinnt/ui/screens/institute_list/institute_list_view.dart';
import 'package:flinnt/ui/screens/join_a_course/join_a_course_view.dart';
import 'package:flinnt/ui/screens/login/login_view.dart';
import 'package:flinnt/ui/screens/register/register_view.dart';
import 'package:flinnt/ui/screens/root/root_view.dart';
import 'package:flinnt/ui/screens/user_profile/user_profile_view.dart';
import 'package:flinnt/ui/screens/verify_email/verify_email_view.dart';
import 'package:flinnt/ui/screens/verify_phone/verify_phone_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: RootScreenView, initial: true),
    MaterialRoute(page: DemoScreenView),
    MaterialRoute(page: HomeScreenView),
    MaterialRoute(page: LoginScreenView),
    MaterialRoute(page: RegisterScreenView),
    MaterialRoute(page: ForgotPasswordScreenView),
    MaterialRoute(page: VerifyPhoneScreenView),
    MaterialRoute(page: VerifyEmailScreenView),
    MaterialRoute(page: CourseContentListScreenView),
    MaterialRoute(page: CourseContentDetailScreenView),
    MaterialRoute(page: UserProfileScreenView),
    MaterialRoute(page: JoinACourseScreenView),
    MaterialRoute(page: InstituteListScreenView),
    MaterialRoute(page: InstituteDetailScreenView),
    MaterialRoute(page: InstituteCourseDetailScreenView),
  ],
  dependencies: [
    // Lazy singletons
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: NavigationService),
    LazySingleton(
        classType: ThemeService, resolveUsing: ThemeService.getInstance),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: LocalDataService),
    LazySingleton(classType: CourseService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: InstituteService),
  ],
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
