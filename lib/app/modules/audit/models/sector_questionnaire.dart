class SectorQuestionnaire {
  SectorQuestionnaire({
    String? message,
    List<Data>? data,
  }) {
    _message = message;
    _data = data;
  }

  SectorQuestionnaire.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  String? _message;
  List<Data>? _data;

  SectorQuestionnaire copyWith({
    String? message,
    List<Data>? data,
  }) =>
      SectorQuestionnaire(
        message: message ?? _message,
        data: data ?? _data,
      );

  String? get message => _message;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    int? questionId,
    String? questionDescription,
    int? departmentId,
    String? industry,
  }) {
    _questionId = questionId;
    _questionDescription = questionDescription;
    _departmentId = departmentId;
    _industry = industry;
  }

  Data.fromJson(dynamic json) {
    _questionId = json['question_id'];
    _questionDescription = json['question_description'];
    _departmentId = json['department_id'];
    _industry = json['industry'];
  }

  int? _questionId;
  String? _questionDescription;
  int? _departmentId;
  String? _industry;

  Data copyWith({
    int? questionId,
    String? questionDescription,
    int? departmentId,
    String? industry,
  }) =>
      Data(
        questionId: questionId ?? _questionId,
        questionDescription: questionDescription ?? _questionDescription,
        departmentId: departmentId ?? _departmentId,
        industry: industry ?? _industry,
      );

  int? get questionId => _questionId;

  String? get questionDescription => _questionDescription;

  int? get departmentId => _departmentId;

  String? get industry => _industry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question_id'] = _questionId;
    map['question_description'] = _questionDescription;
    map['department_id'] = _departmentId;
    map['industry'] = _industry;
    return map;
  }
}
