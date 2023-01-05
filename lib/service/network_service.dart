import 'dart:convert';

import 'package:employeid/models/request_model.dart';
import 'package:http/http.dart';

class Network {
  static String BASE="dummy.restapiexample.com";
  static String API_EMPLOYEES="/api/v1/employees";
  static String API_EMPLOYE="/api/v1/employee/"; //id


  static Future<String?> GET(api) async {
    var url=Uri.https(BASE,api);
    var response=await get(url);
    if (response.statusCode==200) {
      return response.body;
    }
    return null;
  }


  static Future<String?> GETID(api,) async {
    var url=Uri.https(BASE,api,);
    var response=await get(url);
    if (response.statusCode==200) {
      return response.body;
    }
    return null;
  }


  static parsingEmpList(String body) {
    dynamic json=jsonDecode(body);
    var data =EmpList.fromJson(json);
    return data;
  }
}