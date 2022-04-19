import 'package:auditplus/app/modules/index/pages/aboutus_view.dart';
import 'package:auditplus/app/modules/index/pages/dashboard_view.dart';
import 'package:auditplus/app/modules/index/pages/landing_view.dart';
import 'package:auditplus/app/modules/index/pages/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IndexView extends StatelessWidget {
  final RxInt index = 0.obs;
  late PageController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = PageController(initialPage: index.value, keepPage: true);
    return Scaffold(
      body: Row(
        children: [
          Obx(() => NavigationRail(
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.lightbulb_outline_rounded),
                    label: Text("AuditPlus"),
                    selectedIcon: Icon(Icons.lightbulb),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person_outline),
                    label: Text("Register"),
                    selectedIcon: Icon(Icons.person),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.info_outline),
                    label: Text("About Us"),
                    selectedIcon: Icon(Icons.info),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.dashboard_outlined),
                    label: Text("Dashboards"),
                    selectedIcon: Icon(Icons.dashboard),
                  ),
                ],
                groupAlignment: 0,
                onDestinationSelected: (selected) {
                  index.value = selected;
                  _controller.jumpToPage(index.value);
                },
                minWidth: 120.w,
                selectedIndex: index.value,
                backgroundColor: Colors.white,
                extended: false,
                labelType: NavigationRailLabelType.none,
                selectedIconTheme: const IconThemeData(
                  size: 32,
                ),
              )),
          const VerticalDivider(
            width: 1,
          ),
          Expanded(
            child: PageView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              children: [
                LandingPage(),
                LoginPage(),
                AboutUsPage(),
                DashboardPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
