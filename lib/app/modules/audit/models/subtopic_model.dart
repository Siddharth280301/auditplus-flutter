import 'package:auditplus/app/modules/audit/models/question_model.dart';
import 'package:get/get.dart';

class SubtopicModel {
  int topicId;
  int deptId;
  String topicName;
  RxList<QuestionModel>? questionsList;

  SubtopicModel({
    this.topicId = 0,
    this.deptId = 0,
    this.topicName = "",
    this.questionsList,
  });
}
