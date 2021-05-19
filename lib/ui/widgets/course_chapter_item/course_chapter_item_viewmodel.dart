import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/app/app.router.dart';
import 'package:flinnt/models/course.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CourseChapterItemWidgetViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  navigateToCourseContentDetailScreen(Course course) {
    _navigationService.navigateTo(Routes.courseContentDetailScreenView,
        arguments: CourseContentDetailScreenViewArguments(
          course: course,
        ));
  }
}
