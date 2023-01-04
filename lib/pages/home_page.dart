import 'package:flutter/material.dart';

import '../models/employee_model.dart';
import '../models/request_model.dart';
import '../service/service_emp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    parsingEmpList();
    print(a);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }


  List<Employee> _items = [];


  void parsingEmpList() async {
    String? response=await Network.GET(Network.API_EMPS);
    EmpList empList=Network.parsingEmployees(response!);
    _items=empList.data;
  }

}