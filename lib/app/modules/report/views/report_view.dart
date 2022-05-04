import 'package:auditplus/app/customs/custom_colors.dart';
import 'package:auditplus/app/modules/report/controller/report_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportView extends StatelessWidget {
  final controller = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.grey900.withOpacity(0.6),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
          tooltip: "Back",
        ),
        elevation: 0,
        title: const Text(
          "Audit Report",
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      backgroundColor: CustomColors.grey500,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 120.w,
              width: 1.sw,
            ),
            Container(
              width: 0.5.sw,
              height: 0.8.sw,
              padding: EdgeInsets.symmetric(vertical: 80.w, horizontal: 80.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(21, 21, 21, 0.25),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getHeader(controller.reportModel.reportId),
                  SizedBox(height: 100.w),
                  RichText(
                    text: TextSpan(
                      text: "Audit no. : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                      children: [
                        TextSpan(
                          text: controller.reportModel.auditNo,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.w),
                  RichText(
                    text: TextSpan(
                      text: "Sector : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                      children: [
                        TextSpan(
                          text: controller.reportModel.sectorName,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.w),
                  RichText(
                    text: TextSpan(
                      text: "Department name : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                      children: [
                        TextSpan(
                          text: controller.reportModel.departmentName,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.w),
                  RichText(
                    text: TextSpan(
                      text: "Location : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                      children: [
                        TextSpan(
                          text: controller.reportModel.location,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.w),
                  RichText(
                    text: TextSpan(
                      text: "Remarks : ",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text : controller.reportModel.remarks,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  // const Text(
                  //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
                  SizedBox(height: 24.w),
                  Text(
                    "Audit Findings :",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24.w),
                  controller.generateReviewTable(),
                  SizedBox(height: 24.w),
                  RichText(
                    text: TextSpan(
                      text: "Overall score : ",
                      style: TextStyle(fontSize: 20.sp),
                      children: [
                        TextSpan(
                          text: "${controller.overallScore.round()} %",
                          style: TextStyle(
                            color: CustomColors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Rating : ",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      SizedBox(
                        width: 200.w,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              controller.overallScore > 20 ? Icons.star : Icons.star_outline,
                              color: controller.overallScore > 20 ? CustomColors.orange : CustomColors.grey500,
                            ),
                            Icon(
                              controller.overallScore > 40 ? Icons.star : Icons.star_outline,
                              color: controller.overallScore > 40 ? CustomColors.orange : CustomColors.grey500,
                            ),
                            Icon(
                              controller.overallScore > 60 ? Icons.star : Icons.star_outline,
                              color: controller.overallScore > 60 ? CustomColors.orange : CustomColors.grey500,
                            ),
                            Icon(
                              controller.overallScore > 80 ? Icons.star : Icons.star_outline,
                              color: controller.overallScore > 80 ? CustomColors.orange : CustomColors.grey500,
                            ),
                            Icon(
                              controller.overallScore > 95 ? Icons.star : Icons.star_outline,
                              color: controller.overallScore > 95 ? CustomColors.orange : CustomColors.grey500,
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: 24.w),
                      // Text(
                      //   "(4.0)",
                      //   style: TextStyle(color: CustomColors.grey500),
                      // ),
                    ],
                  ),
                  SizedBox(height: 100.w),
                  const Text(
                      "Declaration : I declare that the information provided by me on the above form is true and correct to the best of my knowledge and belief."),
                  SizedBox(height: 24.w),
                  Text(
                    "Firstname Lastname",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp,color: CustomColors.grey700),
                  ),
                  SizedBox(height: 24.w),
                  Chip(
                    label: const Text("Verified Auditor"),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 8.w,horizontal: 4.w),
                    backgroundColor: Colors.lime.shade300,
                    avatar: const CircleAvatar(
                      child: Icon(Icons.verified,color: Colors.green,size: 16,),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.w, width: 1.sw),
          ],
        ),
      ),
    );
  }

  Widget getHeader(String reportNo) {
    return SizedBox(
      width: double.maxFinite,
      height: 80.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo_orange.png",
            height: 80.w,
            width: 80.w,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "auditplus",
                style: GoogleFonts.alice(color: Colors.black, fontSize: 44.sp),
              ),
              Text(
                "Report No. $reportNo",
                style: TextStyle(color: CustomColors.grey800),
              ),
            ],
          ),
          const Spacer(),
          Text(
            controller.reportModel.date,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: CustomColors.grey600,
            ),
          ),
        ],
      ),
    );
  }

}
