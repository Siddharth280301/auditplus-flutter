import 'package:get/get.dart';

class QuestionModel {
  int? questionId;
  String? question;
  RxString? option;

  QuestionModel({this.questionId = 0, this.question, this.option});
}
