import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/app/app.router.dart';
import 'package:flinnt/models/course.dart';
import 'package:flinnt/models/institute.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InstituteCourseItemWidgetViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  navigateToInstituteCourseDetailScreen(Institute institute, Course course) {
    _navigationService.navigateTo(
      Routes.instituteCourseDetailScreenView,
      arguments: InstituteCourseDetailScreenViewArguments(
        institute: institute,
        course: course,
      ),
    );
  }
}
