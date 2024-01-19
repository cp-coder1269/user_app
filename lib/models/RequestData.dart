class RequestData {
  String? name;
  String? email;
  String? expectedSalary;
  String? status;
  String? updateTime;

  RequestData(
      {this.name,
      this.email,
      this.expectedSalary,
      this.status,
      this.updateTime});

  RequestData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    expectedSalary = json['expectedSalary'];
    status = json['status'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['expectedSalary'] = expectedSalary;
    data['status'] = status;
    data['updateTime'] = updateTime;
    return data;
  }
}