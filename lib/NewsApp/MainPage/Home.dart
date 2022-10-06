import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_project/NewsApp/APIArticleNyt/Model/WorldNytModel.dart';
import 'package:listview_project/NewsApp/CovidPage/CovidList.dart';
import 'package:listview_project/NewsApp/Headlines/OtherHeadlines/Dashboard.dart';
import '../APIArticleNyt/NytArticel/WorldNytArticle.dart';

class HomeNews extends StatefulWidget {
  const HomeNews({Key? key}) : super(key: key);

  @override
  State<HomeNews> createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {

  BookNytModel? bookNytModel;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    WorldNytArticle(),
    CovidList(),
    DashboardNews(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true ,
        title:  Text("Besito Times",
          style: GoogleFonts.unifrakturMaguntia(textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),),
        backgroundColor: Colors.white,
      ),
      body:(
          IndexedStack(
            index: _selectedIndex,
            children: _pages,
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 2,
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coronavirus_outlined),
            label: 'Covid-19',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
    );
  }
}
