class MainSectors {
  MainSectors({
    String? message,
    List<Data>? data,
  }) {
    _message = message;
    _data = data;
  }

  MainSectors.fromJson(dynamic json) {
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

  MainSectors copyWith({
    String? message,
    List<Data>? data,
  }) =>
      MainSectors(
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
    int? deptId,
    String? deptName,
  }) {
    _deptId = deptId;
    _deptName = deptName;
  }

  Data.fromJson(dynamic json) {
    _deptId = json['dept_id'];
    _deptName = json['dept_name'];
  }

  int? _deptId;
  String? _deptName;

  Data copyWith({
    int? deptId,
    String? deptName,
  }) =>
      Data(
        deptId: deptId ?? _deptId,
        deptName: deptName ?? _deptName,
      );

  int? get deptId => _deptId;

  String? get deptName => _deptName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dept_id'] = _deptId;
    map['dept_name'] = _deptName;
    return map;
  }
}
