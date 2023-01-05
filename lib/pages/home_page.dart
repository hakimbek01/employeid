import 'package:employeid/models/employee_model.dart';
import 'package:employeid/models/request_model.dart';
import 'package:employeid/pages/detail_page.dart';
import 'package:employeid/service/network_service.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    funk();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: _data.length,
          itemBuilder: (context, index) {
            return _itemOfEmps(_data[index]);
          },
        ),
      ),
    );
  }

  List<Employee> _data=[];

  void funk() async {
    String? response=await Network.GET(Network.API_EMPLOYEES);
    EmpList empList=Network.parsingEmpList(response!);
    setState(() {
      _data=empList.data!;
    });
  }


  Widget _itemOfEmps(Employee emp) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          Navigator.push(context,  MaterialPageRoute(builder: (context) => DetailPage(id: emp.id,)));
        });
      },
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(emp.employee_name.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                SizedBox(width: 10,),
                Text(emp.employee_age.toString(),style: TextStyle(color: Colors.blue),),
              ],
            ),
            SizedBox(height: 10,),
            Text("\$${emp.employee_salary}",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }

}