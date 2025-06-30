import 'package:findjob/controllers/exports.dart';
import 'package:findjob/views/applications/applied_jobs.dart';
import 'package:findjob/views/common/drawer/drawer_screen.dart';
import 'package:findjob/views/common/exports.dart';
import 'package:findjob/views/screens/auth/profile.dart';
import 'package:findjob/views/screens/bookmarks/bookmarks.dart';
import 'package:findjob/views/screens/chat/chats_list.dart';
import 'package:findjob/views/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ZoomNotifier>(
        builder: (context, zoomNotifier, child) {
          // return ZoomNotifier();
          return ZoomDrawer(
            menuScreen: DrawerScreen(
              indexSetter: (index) {
                zoomNotifier.currentIndex = index;
              },
            ),
            borderRadius: 30,
            menuBackgroundColor: Color(kLightBlue.value),
            angle: 0.0,
            slideWidth: 230,

            mainScreen: currentScreen(),
          );
        },
      ),
    );
  }

  Widget currentScreen() {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    switch (zoomNotifier.currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return ChatList();
      case 2:
        return BookmarksPage();
      case 3:
        return AppliedJobs();
      case 4:
        return ProfilePage(drawer: true);
      default:
        return HomePage();
    }
  }
}
