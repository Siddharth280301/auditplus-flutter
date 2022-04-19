import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../customs/custom_colors.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(48.w),
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 400.w,
                      child: Text(
                        "Our Mission",
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
                      width: 680.w,
                      child: Text(
                        "Our mission is to provide a centralized platform to the auditors which increase the efficiency to work across different sectors. To provide a safe and secure system for conducting an audit of an organization. To provide a unique audit system with no need of paperwork and providing clear audit trail.",
                        style: GoogleFonts.roboto(
                          fontSize: 28.sp,
                          color: CustomColors.grey600,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
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
          ),
        ],
      ),
    );
  }
}
