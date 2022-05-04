import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../customs/custom_colors.dart';
import '../models/report_model.dart';

class ReportController extends GetxController {
  ReportModel reportModel = Get.arguments;
  RxDouble overallScore = 0.0.obs;

  Widget generateReviewTable() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.grey500, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
          ListView.separated(
            itemBuilder: (context, index) {
              var topic = reportModel.reviewModels![index];
              return Row(
                children: [
                  Text(
                    topic.topicName,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 100.w,
                    child: topic.score > 80
                        ? Icon(
                            Icons.check,
                            color: CustomColors.orange,
                          )
                        : null,
                  ),
                  SizedBox(
                    width: 100.w,
                    child: topic.score <= 80 && topic.score >= 60
                        ? Icon(
                            Icons.check,
                            color: CustomColors.orange,
                          )
                        : null,
                  ),
                  SizedBox(
                    width: 100.w,
                    child: topic.score < 60
                        ? Icon(
                            Icons.check,
                            color: CustomColors.orange,
                          )
                        : null,
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Divider(height: 24.w),
            itemCount: reportModel.reviewModels!.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }

  void calcOverallScore() {
    int total = 100*reportModel.reviewModels!.length;
    int sum = 0;
    for(var topic in reportModel.reviewModels!){
      sum += topic.score;
    }
    overallScore.value = ((sum/total)*100);
    return;
  }

  @override
  void onInit() {
    super.onInit();
    calcOverallScore();
  }

}
