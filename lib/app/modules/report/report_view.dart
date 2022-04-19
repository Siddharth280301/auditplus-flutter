import 'package:auditplus/app/customs/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  getHeader("12345"),
                  SizedBox(height: 100.w),
                  RichText(
                    text: TextSpan(
                      text: "Audit no. : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                      children: const [
                        TextSpan(
                          text: "102030",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.w),
                  RichText(
                    text: TextSpan(
                      text: "Sector id : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                      children: const [
                        TextSpan(
                          text: "HSP98765",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.w),
                  RichText(
                    text: TextSpan(
                      text: "Sector name : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                      children: const [
                        TextSpan(
                          text: "Bharati Hospital, Satara Road, Pune - 43.",
                          style: TextStyle(fontWeight: FontWeight.normal),
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
                      children: const [
                        TextSpan(
                          text: "Pune, Maharashtra.",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.w),
                  RichText(
                    text: const TextSpan(
                      text: "Remarks : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text:
                              "\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          style: TextStyle(fontWeight: FontWeight.normal),
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
                  getTable(),
                  SizedBox(height: 24.w),
                  RichText(
                    text: TextSpan(
                      text: "Overall score : ",
                      style: TextStyle(fontSize: 20.sp),
                      children: [
                        TextSpan(
                          text: "80 %",
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
                              Icons.star,
                              color: CustomColors.orange,
                            ),
                            Icon(
                              Icons.star,
                              color: CustomColors.orange,
                            ),
                            Icon(
                              Icons.star,
                              color: CustomColors.orange,
                            ),
                            Icon(
                              Icons.star,
                              color: CustomColors.orange,
                            ),
                            Icon(
                              Icons.star_outline,
                              color: CustomColors.grey500,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 24.w),
                      Text(
                        "(4.0)",
                        style: TextStyle(color: CustomColors.grey500),
                      ),
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

  Widget getHeader(String auditNo) {
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
                "Report No. $auditNo",
                style: TextStyle(color: CustomColors.grey800),
              ),
            ],
          ),
          const Spacer(),
          Text(
            "Date : 12th April, 2022",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: CustomColors.grey600,
            ),
          ),
        ],
      ),
    );
  }

  Widget getTable() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.grey500, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 100.w,
                child: const Center(
                  child: Text(
                    "Good",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
                child: const Center(
                  child: Text(
                    "Average",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
                child: const Center(
                  child: Text(
                    "Bad",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 24.w,
          ),
          Row(
            children: [
              const Text(
                "Patient Safety",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              SizedBox(
                width: 100.w,
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: CustomColors.orange,
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
              ),
              SizedBox(
                width: 100.w,
              ),
            ],
          ),
          Divider(
            height: 24.w,
          ),
          Row(
            children: [
              const Text(
                "Patient Care Process",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              SizedBox(
                width: 100.w,
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: CustomColors.orange,
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
              ),
              SizedBox(
                width: 100.w,
              ),
            ],
          ),
          Divider(
            height: 24.w,
          ),
          Row(
            children: [
              const Text(
                "Quality Management",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              SizedBox(
                width: 100.w,
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: CustomColors.orange,
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
              ),
              SizedBox(
                width: 100.w,
              ),
            ],
          ),
          Divider(
            height: 24.w,
          ),
          Row(
            children: [
              const Text(
                "Administrative and Operational",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              SizedBox(
                width: 100.w,
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: CustomColors.orange,
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
              ),
              SizedBox(
                width: 100.w,
              ),
            ],
          ),
          Divider(
            height: 24.w,
          ),
          Row(
            children: [
              const Text(
                "Biomedical Engineering Equipment",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              SizedBox(
                width: 100.w,
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: CustomColors.orange,
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
              ),
              SizedBox(
                width: 100.w,
              ),
            ],
          ),
          Divider(
            height: 24.w,
          ),
          Row(
            children: [
              const Text(
                "Hospital Infrastructure",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              SizedBox(
                width: 100.w,
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: CustomColors.orange,
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
              ),
              SizedBox(
                width: 100.w,
              ),
            ],
          ),
          Divider(
            height: 24.w,
          ),
          Row(
            children: [
              const Text(
                "Information Technology",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              SizedBox(
                width: 100.w,
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: CustomColors.orange,
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
              ),
              SizedBox(
                width: 100.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
