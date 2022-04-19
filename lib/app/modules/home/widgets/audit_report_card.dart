import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../customs/custom_colors.dart';
import '../../report/report_view.dart';

class AuditReportCard extends StatelessWidget {
  const AuditReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.w,
      width: 250.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9.0),
        border: Border.all(
            color: const Color(0xffc4c4c4),
            width: 1.0,
            style: BorderStyle.solid),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 250.w,
            height: 120.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/report_image.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 16.w,top: 20.w),
            child: Text(
              "Audit no. : 12345\nDate : 12th Feb, 2022\nSector : Hospital\nSector name : ABC Hospital, Mumbai",
              style: TextStyle(
                color: CustomColors.grey800,
                fontSize: 16.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(ReportView());
                  },
                  child: const Text("View"),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        CustomColors.orange),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      color: CustomColors.grey800,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}