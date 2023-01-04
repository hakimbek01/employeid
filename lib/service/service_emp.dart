import 'dart:convert';

import 'package:employeid/models/request_model.dart';
import 'package:http/http.dart';

class Network {

  static String BASE="dummy.restapiexample.com";


  //http API s
  static String API_EMPS="/api/v1/employees";
  static String API_EMP="/api/v1/employee/";  //id


  // http requests

  static Future<String?> GET(String api,) async {
    var url=Uri.https(BASE,api);
    var response = await get(url);
    if (response.statusCode==200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> GETID(String api,params) async {
    var url=Uri.https(BASE,api,params);
    var response = await get(url);
    if (response.statusCode==200) {
      return response.body;
    }
    return null;
  }



  static parsingEmployees(String body) {
    dynamic json=jsonDecode(body);
    var data=EmpList.fromJson(json);
    return data;
  }
}