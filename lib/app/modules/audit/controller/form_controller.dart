import 'dart:convert';

import 'package:auditplus/app/modules/audit/models/question_model.dart';
import 'package:auditplus/app/modules/audit/models/sector_questionnaire.dart';
import 'package:auditplus/app/modules/audit/models/subtopic_model.dart';
import 'package:auditplus/app/modules/report/models/report_model.dart';
import 'package:auditplus/app/values/urls.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import '../../../customs/custom_colors.dart';

class FormController extends GetxController {
  final arguments = Get.arguments;

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  RxList<SubtopicModel> subtopicList = RxList.empty();
  String auditNo = "",
      deptId = "",
      deptName = "",
      date = DateTime.now().toString(),
      feedback = "";
  final scheduleController =
  TextEditingController(text: DateTime.now().toString());

  List<SubtopicModel> get topics => subtopicList.toList();
  RxBool isLoading = false.obs,
      checking = false.obs;

  void getTopics() {
    if (arguments['sectorId'] == 1) {
      subtopicList = getManufacturingTopics();
    } else if (arguments['sectorId'] == 2) {
      subtopicList = getHospitalTopics();
    } else if (arguments['sectorId'] == 3) {
      subtopicList = getRestaurantTopics();
    } else if (arguments['sectorId'] == 4) {
      subtopicList = getEducationTopics();
    } else if (arguments['sectorId'] == 5) {
      subtopicList = getHospitalityTopics();
    } else if (arguments['sectorId'] == 6) {
      return;
    }
    return;
  }

  void getQuestionnaire() async {
    try {
      isLoading.value = true;
      var url = "${Urls.baseUrl}${Urls.getQuestions}";
      var data = {"department_id": "${arguments['sectorId']}"};
      var response = await http.post(Uri.parse(url), body: jsonEncode(data));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        var sectorQuestions = SectorQuestionnaire.fromJson(result);
        if (sectorQuestions.message == "Success" &&
            sectorQuestions.data != null) {
          if (arguments['sectorId'] == 1) {
            addManufacturingQuestions(sectorQuestions);
          } else if (arguments['sectorId'] == 2) {
            addHospitalQuestions(sectorQuestions);
          } else if (arguments['sectorId'] == 3) {
            addRestaurantQuestions(sectorQuestions);
          } else if (arguments['sectorId'] == 4) {
            addEducationQuestions(sectorQuestions);
          } else if (arguments['sectorId'] == 5) {
            addHospitalityQuestions(sectorQuestions);
          }
        }
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  void addManufacturingQuestions(SectorQuestionnaire sectorQuestions) {
    for (var que in sectorQuestions.data!) {
      if (que.questionId! >= 0 && que.questionId! < 7) {
        subtopicList[0].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 7 && que.questionId! < 14) {
        subtopicList[1].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 14 && que.questionId! < 21) {
        subtopicList[2].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 21 && que.questionId! < 28) {
        subtopicList[3].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 28 && que.questionId! < 38) {
        subtopicList[4].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      }
    }
    return;
  }

  void addHospitalQuestions(SectorQuestionnaire sectorQuestions) {
    for (var que in sectorQuestions.data!) {
      if (que.questionId! >= 38 && que.questionId! < 47) {
        subtopicList[0].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 47 && que.questionId! < 58) {
        subtopicList[1].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 58 && que.questionId! < 64) {
        subtopicList[2].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 64 && que.questionId! < 73) {
        subtopicList[3].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 73 && que.questionId! < 79) {
        subtopicList[4].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 79 && que.questionId! < 90) {
        subtopicList[5].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 90 && que.questionId! < 103) {
        subtopicList[6].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      }
    }
  }

  void addRestaurantQuestions(SectorQuestionnaire sectorQuestions) {
    for (var que in sectorQuestions.data!) {
      if (que.questionId! >= 103 && que.questionId! < 108) {
        subtopicList[0].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 108 && que.questionId! < 120) {
        subtopicList[1].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 120 && que.questionId! < 126) {
        subtopicList[2].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 126 && que.questionId! < 129) {
        subtopicList[3].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 129 && que.questionId! < 149) {
        subtopicList[4].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 149 && que.questionId! < 155) {
        subtopicList[5].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 155 && que.questionId! < 160) {
        subtopicList[6].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      }
    }
  }

  void addEducationQuestions(SectorQuestionnaire sectorQuestions) {
    for (var que in sectorQuestions.data!) {
      if (que.questionId! >= 160 && que.questionId! < 168) {
        subtopicList[0].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 168 && que.questionId! < 177) {
        subtopicList[1].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 177 && que.questionId! < 185) {
        subtopicList[2].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 185 && que.questionId! < 191) {
        subtopicList[3].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 191 && que.questionId! < 200) {
        subtopicList[4].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 200 && que.questionId! < 210) {
        subtopicList[5].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 210 && que.questionId! < 217) {
        subtopicList[6].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      }
    }
  }

  void addHospitalityQuestions(SectorQuestionnaire sectorQuestions) {
    for (var que in sectorQuestions.data!) {
      if (que.questionId! >= 127 && que.questionId! < 230) {
        subtopicList[0].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 230 && que.questionId! < 250) {
        subtopicList[1].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 250 && que.questionId! < 262) {
        subtopicList[2].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 262 && que.questionId! < 268) {
        subtopicList[3].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 268 && que.questionId! < 279) {
        subtopicList[4].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 279 && que.questionId! < 289) {
        subtopicList[5].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 289 && que.questionId! < 314) {
        subtopicList[6].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      } else if (que.questionId! >= 314 && que.questionId! < 318) {
        subtopicList[6].questionsList!.add(QuestionModel(
          questionId: que.questionId,
          question: que.questionDescription,
          option: "".obs,
        ));
      }
    }
  }

  void addQuestion(BuildContext context, String topicName, int index) {
    String question = '';
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text(
              "Add Question to $topicName",
              style: TextStyle(fontSize: 20.sp),
            ),
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
                horizontal: 40.w, vertical: 24.w),
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
                  if (_formKey2.currentState!.validate()) {
                    subtopicList[index].questionsList!.add(QuestionModel(
                        questionId: 0, question: question, option: "".obs));
                    Navigator.pop(context);
                  }
                },
                child: const Text("ADD"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      CustomColors.orange),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(24.w)),
                ),
              ),
            ],
            content: Form(
              key: _formKey2,
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
                        hintText: "Enter question...",
                      ),
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Question required.';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        question = val;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void addSubTopic(BuildContext context) {
    String topicName = '';
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text(
              "Add Topic",
              style: TextStyle(fontSize: 20.sp),
            ),
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
                horizontal: 40.w, vertical: 24.w),
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
                  if (_formKey1.currentState!.validate()) {
                    subtopicList.add(SubtopicModel(
                        topicName: topicName,
                        deptId: 0,
                        questionsList: RxList.empty(),
                        topicId: topics.last.topicId + 1));
                    Navigator.pop(context);
                  }
                },
                child: const Text("ADD"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      CustomColors.orange),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(24.w)),
                ),
              ),
            ],
            content: Form(
              key: _formKey1,
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
                        labelText: "Topic Name",
                      ),
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Title required.';
                        }
                        return null;
                      },
                      maxLength: 80,
                      onChanged: (val) {
                        topicName = val;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  RxList<SubtopicModel> getManufacturingTopics() {
    return [
      SubtopicModel(
        topicId: 1,
        deptId: arguments['sectorId'],
        topicName: "Raw Material Standards",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 2,
        deptId: arguments['sectorId'],
        topicName: "Documentation of Process",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 3,
        deptId: arguments['sectorId'],
        topicName: "Quality of the Product and Uniformity of Performance",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 4,
        deptId: arguments['sectorId'],
        topicName: "Storage, Packaging and Preservation",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 5,
        deptId: arguments['sectorId'],
        topicName: "Safety of Employee",
        questionsList: RxList.empty(),
      ),
    ].obs;
  }

  RxList<SubtopicModel> getHospitalTopics() {
    return [
      SubtopicModel(
        topicId: 1,
        deptId: arguments['sectorId'],
        topicName: "Patient Safety",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 2,
        deptId: arguments['sectorId'],
        topicName: "Patient Care Processes",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 3,
        deptId: arguments['sectorId'],
        topicName: "Quality Management",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 4,
        deptId: arguments['sectorId'],
        topicName: "Administrative and Operational",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 5,
        deptId: arguments['sectorId'],
        topicName: "Biomedical Engineering Equipment",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 6,
        deptId: arguments['sectorId'],
        topicName: "Hospital Infrastructure",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 7,
        deptId: arguments['sectorId'],
        topicName: "Information Technology",
        questionsList: RxList.empty(),
      ),
    ].obs;
  }

  RxList<SubtopicModel> getRestaurantTopics() {
    return [
      SubtopicModel(
        topicId: 1,
        deptId: arguments['sectorId'],
        topicName: "Infrastructure",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 2,
        deptId: arguments['sectorId'],
        topicName: "Safety",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 3,
        deptId: arguments['sectorId'],
        topicName: "Cleanliness",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 4,
        deptId: arguments['sectorId'],
        topicName: "Staff Points",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 5,
        deptId: arguments['sectorId'],
        topicName: "Maintenance",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 6,
        deptId: arguments['sectorId'],
        topicName: "Food Management",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 7,
        deptId: arguments['sectorId'],
        topicName: "Information Technology",
        questionsList: RxList.empty(),
      ),
    ].obs;
  }

  RxList<SubtopicModel> getEducationTopics() {
    return [
      SubtopicModel(
        topicId: 1,
        deptId: arguments['sectorId'],
        topicName: "Institution",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 2,
        deptId: arguments['sectorId'],
        topicName: "Teaching and Learning Strategy",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 3,
        deptId: arguments['sectorId'],
        topicName: "Library",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 4,
        deptId: arguments['sectorId'],
        topicName: "Placement Cell",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 5,
        deptId: arguments['sectorId'],
        topicName: "Students Support",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 6,
        deptId: arguments['sectorId'],
        topicName: "Information Technology",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 7,
        deptId: arguments['sectorId'],
        topicName: "College Infrastructure",
        questionsList: RxList.empty(),
      ),
    ].obs;
  }

  RxList<SubtopicModel> getHospitalityTopics() {
    return [
      SubtopicModel(
        topicId: 1,
        deptId: arguments['sectorId'],
        topicName: "General",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 2,
        deptId: arguments['sectorId'],
        topicName: "Accommodation",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 3,
        deptId: arguments['sectorId'],
        topicName: "Kitchen",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 4,
        deptId: arguments['sectorId'],
        topicName: "Toilets",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 5,
        deptId: arguments['sectorId'],
        topicName: "Miscellaneous",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 6,
        deptId: arguments['sectorId'],
        topicName: "Security",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 7,
        deptId: arguments['sectorId'],
        topicName: "Hotel Amenities",
        questionsList: RxList.empty(),
      ),
      SubtopicModel(
        topicId: 8,
        deptId: arguments['sectorId'],
        topicName: "Tourism Facility",
        questionsList: RxList.empty(),
      ),
    ].obs;
  }

  void checkAll() {
    if(subtopicList.isNotEmpty){
      for (var topic in subtopicList.toList()) {
        if(topic.questionsList!.isNotEmpty){
          for (var q in topic.questionsList!.toList()) {
            if (q.option!.value.isEmpty) {
              Get.showSnackbar(GetSnackBar(
                titleText: Text(
                  "Audit Incomplete",
                  style: TextStyle(color: CustomColors.grey900),
                ),
                messageText: Text(
                  "Attempt all the questions, and check for all details.",
                  style: TextStyle(color: CustomColors.grey900),
                ),
                icon: Icon(
                  Icons.warning_amber_rounded,
                  color: CustomColors.grey900,
                ),
                duration: const Duration(seconds: 5),
                snackPosition: SnackPosition.TOP,
                backgroundColor: CustomColors.grey100,
              ));
              return;
            } else {
              continue;
            }
          }
        } else {
          Get.showSnackbar(GetSnackBar(
            titleText: Text(
              "Audit Incomplete",
              style: TextStyle(color: CustomColors.grey900),
            ),
            messageText: Text(
              "No questions found in ${topic.topicName}, add at-least one question for audit report.",
              style: TextStyle(color: CustomColors.grey900),
            ),
            icon: Icon(
              Icons.warning_amber_rounded,
              color: CustomColors.grey900,
            ),
            duration: const Duration(seconds: 5),
            snackPosition: SnackPosition.TOP,
            backgroundColor: CustomColors.grey100,
          ));
          return;
        }
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        titleText: Text(
          "Audit Incomplete",
          style: TextStyle(color: CustomColors.grey900),
        ),
        messageText: Text(
          "No topics found, add at-least one topic for audit report.",
          style: TextStyle(color: CustomColors.grey900),
        ),
        icon: Icon(
          Icons.warning_amber_rounded,
          color: CustomColors.grey900,
        ),
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.TOP,
        backgroundColor: CustomColors.grey100,
      ));
      return;
    }
    if (auditNo.isEmpty ||
        deptId.isEmpty ||
        deptName.isEmpty ||
        feedback.isEmpty) {
      Get.showSnackbar(GetSnackBar(
        titleText: Text(
          "Audit Incomplete",
          style: TextStyle(color: CustomColors.grey900),
        ),
        messageText: Text(
          "Fill all the details for report generation",
          style: TextStyle(color: CustomColors.grey900),
        ),
        icon: Icon(
          Icons.warning_amber_rounded,
          color: CustomColors.grey900,
        ),
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.TOP,
        backgroundColor: CustomColors.grey100,
      ));
      return;
    } else {
      generateReport();
    }
  }

  void generateReport() {
    final reportModel = ReportModel(
        userId: 0,
        userName: "Firstname Lastname",
        sectorId: arguments['sectorId'],
        auditNo: auditNo,
        sectorName: arguments['sectorName'],
        departmentName: deptName,
        date: date,
        remarks: feedback,
        location: "NA",
        reviewModels: []
    );
    for (var topic in subtopicList.toList()) {
      if (topic.questionsList != null) {
        int total = topic.questionsList!.length;
        int pos = 0;
        for (var q in topic.questionsList!.toList()) {
          if (q.option!.value.isNotEmpty && q.option!.value == "Yes") {
            pos += 1;
          } else if (q.option!.value.isNotEmpty && q.option!.value == "NA") {
            total -= 1;
          }
        }
        reportModel.reviewModels!.add(ReviewModel(
            topicId: topic.topicId, topicName: topic.topicName, score: ((pos~/total)*100)));
      }
    }
    goToReport(reportModel);
  }

  void goToReport(ReportModel reportModel){
    Get.offNamed('/report',arguments: reportModel);
  }

  @override
  void onInit() async {
    super.onInit();
    getTopics();
    getQuestionnaire();
  }
}
