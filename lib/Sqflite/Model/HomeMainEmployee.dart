import 'package:flutter/material.dart';

import 'Empolyee.dart';
import 'MyEmployeeList.dart';
import 'dbHelper.dart';

class HomeMainEmployee extends StatefulWidget {
  HomeMainEmployee({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeMainEmployee> createState() => _HomeMainEmployeeState();
}

class _HomeMainEmployeeState extends State<HomeMainEmployee> {

  Employee employee = Employee(firstName: '', lastName: '', emailId: '', mobileNo: '');

  late String firstname;
  late String lastname;
  late String emailId;
  late String mobileno;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          title: Text('Saving Employee'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.view_list),
              tooltip: 'Next choice',
              onPressed: () {
                navigateToEmployeeList();
              },
            ),
          ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (val) =>
                val!.isEmpty ?"Enter FirstName" : null,
                onSaved: (val) => this.firstname = val!,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (val) =>
                val!.length ==0 ? 'Enter LastName' : null,
                onSaved: (val) => this.lastname = val!,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Mobile No'),
                validator: (val) =>
                val!.length ==0 ? 'Enter Mobile No' : null,
                onSaved: (val) => this.mobileno = val!,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email Id'),
                validator: (val) =>
                val!.length ==0 ? 'Enter Email Id' : null,
                onSaved: (val) => this.emailId = val!,
              ),
              Container(margin: const EdgeInsets.only(top: 10.0),child: ElevatedButton(onPressed: _submit,
                child: Text('Save Employee'),),)

            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (this.formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }else{
      return null;
    }
    var employee = Employee(firstName: '', lastName: '', emailId: '', mobileNo: '');
    var dbHelper = DBHelper();
    dbHelper.saveEmployee(employee);
    navigateToEmployeeList();
  }

  void navigateToEmployeeList(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyEmployeeList()),
    );
  }
}
