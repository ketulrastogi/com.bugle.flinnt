import 'package:cached_network_image/cached_network_image.dart';
import 'package:flinnt/ui/screens/institute_list/institute_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class InstituteListScreenView extends StatelessWidget {
  const InstituteListScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InstituteListScreenViewModel>.reactive(
      onModelReady: (model) async => await model.getInstituteList(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Select Institute'),
        ),
        body: (model.isBusy)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemCount: model.instituteList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => model.navigateToInstituteDetailsScreen(
                        model.instituteList[index]),
                    leading: Container(
                      height: 40.0,
                      width: 40.0,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        // imageUrl: '${model.instituteList[index].userPicture}',
                        imageUrl: 'http://via.placeholder.com/40x40',
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    title: Text('${model.instituteList[index].userSchoolName}'),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                      // height: 2.0,
                      );
                },
              ),
      ),
      viewModelBuilder: () => InstituteListScreenViewModel(),
    );
  }
}
