class Employee {
  String? employee_name;
  int? employee_salary;
  int? employee_age;
  String? profile_image;
  int? id;
  Employee.fromJson(Map<String,dynamic> json){
    id=json['id'];
    employee_name=json['employee_name'];
    employee_age=json['employee_age'];
    employee_salary=json['employee_salary'];
    profile_image=json['profile_image'];
  }

  Map<String,dynamic> toJson()=>{
    "id":id,
    "employee_salary":employee_salary,
    "employee_age":employee_age,
    "employee_name":employee_name,
    "profile_image":profile_image
  };
}