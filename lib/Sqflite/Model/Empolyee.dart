import '../database_helper.dart';

class Employee {
  String firstName;
  String lastName;
  String mobileNo;
  String emailId;

  Employee({
    required this.firstName,
    required this.lastName,
    required this.mobileNo,
    required this.emailId,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      firstName: json['firstName'],
      lastName: json['lastName'],
      mobileNo: json['mobileNo'],
      emailId: json['emailId'],
    );
  }
}