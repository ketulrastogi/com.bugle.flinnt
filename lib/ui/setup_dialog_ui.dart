import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/enums/dialog_type.dart';
import 'package:flinnt/global/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {
  var dialogService = locator<DialogService>();

  final builders = {
    DialogType.Basic: (context, sheetRequest, completer) =>
        _BasicDialog(request: sheetRequest, completer: completer)
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicDialog({Key key, this.request, this.completer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(21),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              request.title,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              request.description,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => completer(DialogResponse(confirmed: true)),
              child: Container(
                child: request.showIconInMainButton
                    ? Icon(Icons.check_circle)
                    : Text(
                        request.mainButtonTitle,
                        style: Theme.of(context).textTheme.button.copyWith(
                              color: white,
                            ),
                      ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
