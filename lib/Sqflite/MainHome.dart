import 'package:flutter/material.dart';

import 'database_helper.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sqflite'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: () async{
              int id = await DatabaseHelper.instance.insert({
                DatabaseHelper.columnName: 'Amri'
              });
              print('inserted row id: $id');

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('inserted row id: $id'),
                ),
              );

            }, child: Text('Insert')),
            ElevatedButton(onPressed: () async{
              List<Map<String, dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
              print('query all rows: $queryRows');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('query all rows: $queryRows'),
                ),
              );
            }, child: const Text('query')),
            ElevatedButton(onPressed: () async{
              int updateId = await DatabaseHelper.instance.update({
                DatabaseHelper.columnId: 1,
                DatabaseHelper.columnName: "Hiba"
              });
              print('updated row id: $updateId');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('updated row id: $updateId name: Hiba'),
                ),
              );
            }, child: Text('update')),
            ElevatedButton(onPressed: ()async{
              int rowsDeleted = await DatabaseHelper.instance.delete(1);
              print('deleted $rowsDeleted');

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('deleted $rowsDeleted row id: 1'),
                ),
              );
            }, child: const Text('delete')),
          ],
        )
      ),
    );
  }
}
