import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flinnt/global/app_colors.dart';
import 'package:flinnt/ui/screens/home/home_viewmodel.dart';
import 'package:flinnt/ui/widgets/communication/communication_view.dart';
import 'package:flinnt/ui/widgets/main_drawer/main_drawer_view.dart';
import 'package:flinnt/ui/widgets/my_course_list/my_course_list_view.dart';
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

import 'package:stacked/stacked.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Flinnt'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.qr_code_scanner),
                onPressed: () {},
              ),
            ],
          ),
          drawer: MainDrawerWidgetView(),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.shop,
            ),
            onPressed: () {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: [
              CommunityMaterialIcons.post_outline,
              CommunityMaterialIcons.book_open_blank_variant,
              CommunityMaterialIcons.desktop_mac_dashboard,
              CommunityMaterialIcons.account,

              // Icons.ac_unit,
              // Icons.android,
              // Icons.access_alarm,
              // Icons.accessibility
            ],
            activeIndex: model.currentIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.defaultEdge,
            onTap: (index) => model.setCurrentIndex(index),

            //other params
          ),
          // bottomNavigationBar: Container(
          //   decoration: BoxDecoration(
          //     color: white,
          //     boxShadow: [
          //       BoxShadow(
          //         color: bulletGreyColor,
          //         spreadRadius: 1.0,
          //         blurRadius: 4.0,
          //       ),
          //     ],
          //   ),
          //   child: DotNavigationBar(
          //     currentIndex: model.currentIndex,
          //     margin: EdgeInsets.zero,
          //     onTap: (int value) => model.setCurrentIndex(value),
          //     // dotIndicatorColor: Colors.black,
          //     items: [
          //       /// Home
          //       DotNavigationBarItem(
          //         icon: Icon(Icons.home),
          //         // selectedColor: Colors.purple,
          //       ),

          //       /// Likes
          //       DotNavigationBarItem(
          //         icon: Icon(Icons.book),
          //         // selectedColor: Colors.pink,
          //       ),

          //       /// Likes
          //       DotNavigationBarItem(
          //         icon: Icon(Icons.shopping_basket_rounded),
          //         // selectedColor: Colors.pink,
          //       ),

          //       /// Search
          //       DotNavigationBarItem(
          //         icon: Icon(Icons.leaderboard_rounded),
          //         // selectedColor: Colors.orange,
          //       ),

          //       /// Profile
          //       DotNavigationBarItem(
          //         icon: Icon(Icons.person),
          //         // selectedColor: Colors.teal,
          //       ),
          //     ],
          //   ),
          // ),
          body: IndexedStack(
            index: model.currentIndex,
            children: [
              CommunicationWidgetView(),
              MyCourseListWidgetView(),
            ],
          ),
        );
      },
      viewModelBuilder: () => HomeScreenViewModel(),
    );
  }
}
