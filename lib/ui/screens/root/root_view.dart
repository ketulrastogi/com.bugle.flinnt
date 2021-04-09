import 'package:flinnt/ui/screens/root/root_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RootScreenView extends StatelessWidget {
  const RootScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RootScreenViewModel>.reactive(
      onModelReady: (model) async => await model.authenticateUser(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/splash.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
      viewModelBuilder: () => RootScreenViewModel(),
    );
  }
}
