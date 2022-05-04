class ReportModel {
  int userId, sectorId;
  String reportId,
      auditNo,
      sectorName,
      departmentName,
      date,
      remarks,
      location,
      userName;
  List<ReviewModel>? reviewModels;

  ReportModel(
      {required this.userId,
      required this.userName,
      required this.sectorId,
      this.reportId = "NA",
      required this.auditNo,
      required this.sectorName,
      required this.departmentName,
      required this.date,
      required this.remarks,
      required this.location,
      this.reviewModels});
}

class ReviewModel {
  int topicId;
  String topicName;
  int score;

  ReviewModel(
      {required this.topicId, required this.topicName, required this.score});
}
