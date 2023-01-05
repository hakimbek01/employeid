import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/employee_model.dart';
import '../models/request_model.dart';
import '../service/network_service.dart';

class DetailPage extends StatefulWidget {
  final int? id;
  const DetailPage({Key? key, this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  void initState() {
    funk();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Full Indos"),
      ),
      body: Center(
        child: isLoading?CircularProgressIndicator():Container(
          height: 300,
          width: 300,
          padding: EdgeInsets.all(20),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text("name:",style: TextStyle(fontSize: 18),),
                  SizedBox(width: 7,),
                  Text(map['data']['employee_name'],style: TextStyle(fontSize: 18),)
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text("age:",style: TextStyle(fontSize: 18),),
                  SizedBox(width: 7,),
                  Text(map['data']['employee_age'].toString(),style: TextStyle(fontSize: 18),)
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text("salary:",style: TextStyle(fontSize: 18),),
                  SizedBox(width: 7,),
                  Text(map['data']['employee_salary'].toString(),style: TextStyle(fontSize: 18),)
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text("id:",style: TextStyle(fontSize: 18),),
                  SizedBox(width: 7,),
                  Text(map['data']['id'].toString(),style: TextStyle(fontSize: 18),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Employee> _data=[];
  Map<String,dynamic> map={};
  bool isLoading = true;
  void funk() async {
    String? response=await Network.GETID(Network.API_EMPLOYE+widget.id.toString());
    setState(() {
      map=jsonDecode(response!);
      isLoading=false;
    });
    print(map['data']);
  }
}
