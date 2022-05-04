import 'package:auditplus/app/modules/audit/views/audit_form_view.dart';
import 'package:auditplus/app/modules/home/views/home_view.dart';
import 'package:auditplus/app/modules/index/views/index_view.dart';
import 'package:auditplus/app/modules/register/views/register_view.dart';
import 'package:auditplus/app/modules/report/views/report_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      splitScreenMode: false,
      minTextAdapt: false,
      builder: () => GetMaterialApp(
        title: 'Flutter Demo',
        textDirection: TextDirection.ltr,
        debugShowCheckedModeBanner: false,
        initialRoute: '/index',
        getPages: [
          GetPage(
              name: '/index',
              page: () => IndexView(),
              transition: Transition.noTransition),
          GetPage(
              name: '/register',
              page: () => RegisterView(),
              transition: Transition.noTransition),
          GetPage(
              name: '/home',
              page: () => HomeView(),
              transition: Transition.noTransition),
          GetPage(
              name: '/auditForm',
              page: () => FormView(),
              transition: Transition.noTransition),
          GetPage(
              name: '/report',
              page: () => ReportView(),
              transition: Transition.noTransition),
        ],
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
      ),
    );
  }
}
