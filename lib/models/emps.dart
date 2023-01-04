import 'package:employeid/models/emp.dart';

class EmpList {
  String? status;
  String? message;
  List<Employee>? data;

  EmpList.fromJson(Map<dynamic,dynamic> json) {
   status=json['status'];
   message=json['message'];
   data=List<Employee>.from(json['data'].map((e) => Employee.fromJson(e)));
  }

  Map<String,dynamic> toJson()=>{
    'status':status,
    'message':message,
    'data':List.from(data!.map((e) => e.toJson()))
  };
}