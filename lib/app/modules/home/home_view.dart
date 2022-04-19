import 'package:auditplus/app/customs/custom_appbar.dart';
import 'package:auditplus/app/customs/custom_colors.dart';
import 'package:auditplus/app/modules/audit/audit_form_view.dart';
import 'package:auditplus/app/modules/home/widgets/sector_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/audit_report_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Welcome User !",
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            tooltip: "Logout",
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CircleAvatar(
              backgroundColor: CustomColors.grey100,
              child: Icon(
                Icons.person_outline,
                color: CustomColors.grey800,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: CustomColors.grey100,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(24.w),
              //height: 400.h,
              width: 1.sw,
              padding: EdgeInsets.all(40.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(21, 21, 21, 0.25),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sectors :",
                    style:
                        TextStyle(color: CustomColors.grey900, fontSize: 24.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 20.w,
                    runSpacing: 20.w,
                    children: [
                      SectorCard(
                          title: "Educational",
                          time: "3",
                          page: const FormView(),
                          desc:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          sectorIcon: Icons.school_rounded),
                      SectorCard(
                          title: "Restaurant",
                          time: "3",
                          page: const FormView(),
                          desc:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          sectorIcon: Icons.restaurant_rounded),
                      SectorCard(
                          title: "Manufacturing",
                          time: "3",
                          page: const FormView(),
                          desc:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          sectorIcon: Icons.precision_manufacturing_rounded),
                      SectorCard(
                          title: "Hospitals",
                          time: "3",
                          page: const FormView(),
                          desc:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          sectorIcon: Icons.local_hospital_outlined),
                      SectorCard(
                          title: "Hospitality",
                          time: "3",
                          page: const FormView(),
                          desc:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          sectorIcon: Icons.local_hotel_rounded),
                    ],
                  ),
                  SizedBox(
                    height: 28.w,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("Add sector");
                    },
                    child: const Text("+ Add Sector"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(CustomColors.orange),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(24.w)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              //height: 400.w,
              width: 1.sw,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(21, 21, 21, 0.25),
                    blurRadius: 10,
                  ),
                ],
              ),
              padding: EdgeInsets.all(40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reports :",
                    style:
                        TextStyle(color: CustomColors.grey900, fontSize: 24.sp),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 20.w,
                    runSpacing: 20.w,
                    children: const [
                      AuditReportCard(),
                      AuditReportCard(),
                      AuditReportCard(),
                      AuditReportCard(),
                      AuditReportCard(),
                      AuditReportCard(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.w,),
          ],
        ),
      ),
    );
  }
}
