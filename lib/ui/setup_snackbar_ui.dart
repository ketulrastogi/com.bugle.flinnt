import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/enums/snackbar_type.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  // Registers a config to be used when calling showSnackbar
  service.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: Colors.red,
    textColor: Colors.white,
    mainButtonTextColor: Colors.black,
  ));

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      titleColor: Colors.white,
      borderRadius: 1,
      // animationDuration: Duration(milliseconds: 250),
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      titleColor: Colors.white,
      messageColor: Colors.white,
      borderRadius: 1,
      // animationDuration: Duration(milliseconds: 250),
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.info,
    config: SnackbarConfig(
      backgroundColor: Colors.yellow,
      titleColor: Colors.black,
      messageColor: Colors.black,
      borderRadius: 1,
      // animationDuration: Duration(milliseconds: 250),
    ),
  );
}
