import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../customs/custom_colors.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 100.w),
      decoration: BoxDecoration(
        color: CustomColors.grey200,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 400.w,
              child: Text(
                "Dashboard",
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
                "Dashboard to be displayed here.",
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
      ),
    );
  }
}
