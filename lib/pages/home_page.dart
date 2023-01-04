import 'package:flutter/material.dart';

import '../models/emp.dart';
import '../models/emps.dart';
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
    print(_items);
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
    _items=empList;
  }

}