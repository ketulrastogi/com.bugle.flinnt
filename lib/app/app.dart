import 'package:flinnt/services/auth.dart';
import 'package:flinnt/ui/screens/demo/demo_view.dart';
import 'package:flinnt/ui/screens/forgot_password/forgot_password_view.dart';
import 'package:flinnt/ui/screens/home/home_view.dart';
import 'package:flinnt/ui/screens/login/login_view.dart';
import 'package:flinnt/ui/screens/register/register_view.dart';
import 'package:flinnt/ui/screens/verify_email/verify_email_view.dart';
import 'package:flinnt/ui/screens/verify_phone/verify_phone_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: DemoScreenView, initial: true),
    MaterialRoute(page: HomeScreenView),
    MaterialRoute(page: LoginScreenView),
    MaterialRoute(page: RegisterScreenView),
    MaterialRoute(page: ForgotPasswordScreenView),
    MaterialRoute(page: VerifyPhoneScreenView),
    MaterialRoute(page: VerifyEmailScreenView),
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
  ],
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
