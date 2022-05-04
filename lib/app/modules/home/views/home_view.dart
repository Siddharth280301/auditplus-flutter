import 'package:auditplus/app/customs/custom_appbar.dart';
import 'package:auditplus/app/customs/custom_colors.dart';
import 'package:auditplus/app/modules/home/controller/home_controller.dart';
import 'package:auditplus/app/modules/home/models/sector_card_model.dart';
import 'package:auditplus/app/modules/home/widgets/sector_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/audit_report_card.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Welcome ${controller.userData['firstname']} !",
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed('/index');
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
                  Obx(
                    () => controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: CustomColors.grey400,
                            ),
                          )
                        : Wrap(
                            direction: Axis.horizontal,
                            spacing: 20.w,
                            runSpacing: 20.w,
                            children: List.generate(
                                controller.sectorList.length,
                                (index) => SectorCard(
                                    id: controller.sectorList[index].sectorId,
                                    title: controller.sectorList[index]
                                        .sectorName.capitalizeFirst!,
                                    time:
                                        controller.sectorList[index].surveyTime,
                                    sectorIcon: controller
                                        .sectorList[index].sectorIcon),
                                growable: true),
                          ),
                  ),
                  SizedBox(
                    height: 28.w,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showAddSectorDialog(context);
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
                  Obx(
                    () => controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: CustomColors.grey400,
                            ),
                          )
                        : Wrap(
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
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.w,
            ),
          ],
        ),
      ),
    );
  }

  void showAddSectorDialog(BuildContext context) {
    String name = "", desc = "";
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Add Sector",
          style: TextStyle(fontSize: 20.sp),
        ),
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.all(40.w),
        actionsPadding: EdgeInsets.only(right: 24.w, bottom: 24.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(24.w)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.sectors.add(SectorCardModel(
                  sectorId: controller.sectorList.last.sectorId + 1,
                  sectorName: name,
                  isUserSector: true,
                  sectorIcon: Icons.account_balance,
                ));
                Navigator.pop(context);
              }
            },
            child: const Text("ADD"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(CustomColors.orange),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(EdgeInsets.all(24.w)),
            ),
          ),
        ],
        content: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 360.w,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Sector Title",
                  ),
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter valid title.';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    name = val;
                  },
                ),
              ),
              SizedBox(
                height: 24.w,
              ),
              SizedBox(
                width: 360.w,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Sector Description",
                  ),
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter valid description.';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    desc = val;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
