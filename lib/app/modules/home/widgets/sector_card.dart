import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../customs/custom_colors.dart';

class SectorCard extends StatelessWidget {
  final String title, time, desc;
  final IconData sectorIcon;
  final page;

  SectorCard(
      {required this.title,
      required this.time,
      required this.desc,
      required this.sectorIcon,
      required this.page});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(page);
      },
      splashColor: CustomColors.grey100,
      child: Container(
        height: 180.w,
        width: 400.w,
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.circular(9.0),
          border: Border.all(
              color: const Color(0xffc4c4c4),
              width: 1.0,
              style: BorderStyle.solid),
        ),
        padding: EdgeInsets.all(28.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: CustomColors.grey900,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  sectorIcon,
                  color: CustomColors.grey900,
                  size: 44.w,
                ),
              ],
            ),
            Text(
              "Approx. $time minutes.",
              style: TextStyle(
                  color: CustomColors.grey900,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "Description: $desc",
              style: TextStyle(
                  color: CustomColors.grey900,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
