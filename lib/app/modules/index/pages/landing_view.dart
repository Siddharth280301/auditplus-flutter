import 'package:auditplus/app/customs/custom_colors.dart';
import 'package:auditplus/app/modules/register/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 48.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 100.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(21),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 840.w,
                          child: Text(
                            "Robust , Intuative and Customizable Audit System",
                            style: GoogleFonts.roboto(
                              color: CustomColors.grey700,
                              fontWeight: FontWeight.w300,
                              fontSize: 52.sp,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 48.w,
                        ),
                        SizedBox(
                          width: 600.w,
                          child: Text(
                            "AuditPlus Audit Management solution manages end-to-end audit lifecycle and compliance for Hospital, Manufacturing, Pharma and many more sectors.",
                            style: GoogleFonts.roboto(
                              fontSize: 28.sp,
                              color: CustomColors.grey600,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 48.w,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/register');
                          },
                          child: Text(
                            "Request Demo",
                            style: TextStyle(fontSize: 24.sp),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.yellow),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                CustomColors.grey900),
                            elevation: MaterialStateProperty.all<double>(0),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.all(32.w)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logo_orange.png",
                          width: 280.w,
                          height: 280.w,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 48.w,
                        ),
                        Text(
                          "auditplus",
                          style: GoogleFonts.alice(
                              color: CustomColors.grey900, fontSize: 72.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 120.w,
                ),
                Container(
                  width: double.maxFinite,
                  height: 640.w,
                  margin: EdgeInsets.symmetric(horizontal: 56.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(51.w),
                        topRight: Radius.circular(51.w)),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/graphic_one.png"),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.w,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getOutlinedCard(
                        Icons.groups_outlined,
                        "Suitable for multiple sectors",
                        "Our customers range from small to large enterprises from multiple sectors."),
                    getOutlinedCard(
                        Icons.attach_money_outlined,
                        "Cost-efficient",
                        "AuditPlus offers a cost-effective solution to auditors seeking an inexpensive way to improve their efficiency."),
                    getOutlinedCard(Icons.security_outlined, "Data Security",
                        "AuditPlus makes it easy to securely manage and store users related data."),
                    getOutlinedCard(Icons.tag_faces, "User-friendly Interface",
                        "An intuitive format that seamlessly guides users from step-to-step."),
                  ],
                ),
                SizedBox(
                  height: 80.w,
                ),
                Container(
                  width: double.maxFinite,
                  height: 320.w,
                  margin: EdgeInsets.symmetric(horizontal: 56.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(51.w),
                    color: const Color.fromRGBO(25, 198, 253, 0.45),
                  ),
                  child: Center(
                    child: Text(
                      "Manage all aspects of the audit lifecycle process : \nAudit, Log Observations, Assess Compliance, \nand assign corrective actions.",
                      style: GoogleFonts.roboto(
                        color: CustomColors.grey900,
                        fontWeight: FontWeight.w300,
                        fontSize: 44.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getOutlinedCard(IconData icon, String title, String text) {
    return Container(
      height: 320.w,
      padding: EdgeInsets.all(44.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        border: Border.all(color: CustomColors.grey200),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: CustomColors.grey400,
              size: 64.w,
            ),
            SizedBox(
              height: 12.w,
            ),
            SizedBox(
              width: 200.w,
              child: Text(
                title,
                style: GoogleFonts.roboto(
                  color: CustomColors.grey800,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 12.w,
            ),
            SizedBox(
              width: 200.w,
              child: Text(
                text,
                style: GoogleFonts.roboto(
                  color: CustomColors.grey700,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
