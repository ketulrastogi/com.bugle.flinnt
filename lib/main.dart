import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/app/app.router.dart';
import 'package:flinnt/global/text_theme.dart';
import 'package:flinnt/ui/setup_bottom_sheet_ui.dart';
import 'package:flinnt/ui/setup_dialog_ui.dart';
import 'package:flinnt/ui/setup_snackbar_ui.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
// import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() {
  setupLocator();
  setupSnackbarUi();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(MyApp());
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // disableScreenShot();
  }

  // Future<void> disableScreenShot() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flinnt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: textTheme,
      ),
      // initialRoute: Routes.registerScreenViewRoute,
      initialRoute: Routes.rootScreenView,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      // home: LineChartSample1(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
    );
  }
}
