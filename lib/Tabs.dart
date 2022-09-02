import 'package:flutter/material.dart';
import 'package:listview_project/APISports/ListAllFootbal.dart';
import 'package:listview_project/listview.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {

  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Icon(Icons.contact_phone)),
    Tab(icon: Icon(Icons.sports_baseball)),
    Tab(icon: Icon(Icons.person_outline)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
            },
            controller: _controller,
            tabs: list,
          ),
          title: Text("Tabs"),
        ),
        body: TabBarView(
         controller: _controller,
          children: [
            listview(),
            ListAllFootball(),
            Center(child: Text("Tab 3")),
          ],
        ),
      ),
    );
  }
}
