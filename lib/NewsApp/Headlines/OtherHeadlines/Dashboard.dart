import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_project/NewsApp/APIArticleNyt/NytArticel/ListMovieNyt.dart';
import 'package:listview_project/NewsApp/APIArticleNyt/NytArticel/WorldNytArticle.dart';
import 'package:listview_project/NewsApp/Headlines/OtherHeadlines/Business.dart';
import 'package:listview_project/NewsApp/Headlines/OtherHeadlines/Entertaiment.dart';
import 'package:listview_project/NewsApp/Headlines/OtherHeadlines/Health.dart';
import 'package:listview_project/NewsApp/Headlines/OtherHeadlines/Sains.dart';
import 'package:listview_project/NewsApp/Headlines/OtherHeadlines/Sports.dart';
import 'package:listview_project/NewsApp/Headlines/OtherHeadlines/Technology.dart';
import 'package:listview_project/listview.dart';

class DashboardNews extends StatefulWidget {
  const DashboardNews({Key? key}) : super(key: key);

  @override
  State<DashboardNews> createState() => _DashboardNewsState();
}

class _DashboardNewsState extends State<DashboardNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //list and ontap
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WorldNytArticle(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
            child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.public,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'World',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.ptSerif(textStyle: TextStyle(fontWeight: FontWeight.w500)).fontFamily,
                    ),
                  ),
                ]
            ),
          ),
        ),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Business(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.business,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Bisnis',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.ptSerif(textStyle: TextStyle(fontWeight: FontWeight.w500)).fontFamily,
                    ),
                  ),
                ]
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Entertaiment(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.movie,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Enterainment',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.ptSerif(textStyle: TextStyle(fontWeight: FontWeight.w500)).fontFamily,
                    ),
                  ),
                ]
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Sains(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.biotech,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Sains',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: GoogleFonts.ptSerif(textStyle: TextStyle(fontWeight: FontWeight.w500)).fontFamily,
                      ),
                    ),
                  ]
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Health(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.health_and_safety,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Kesehatan',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: GoogleFonts.ptSerif(textStyle: TextStyle(fontWeight: FontWeight.w500)).fontFamily,
                      ),
                    ),
                  ]
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Sports()));
              });
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.sports_baseball,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Olah Raga',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: GoogleFonts.ptSerif(textStyle: TextStyle(fontWeight: FontWeight.w500)).fontFamily,
                      ),
                    ),
                  ]
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Technology(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.developer_board,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Teknologi',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: GoogleFonts.ptSerif(textStyle: TextStyle(fontWeight: FontWeight.w500)).fontFamily,
                      ),
                    ),
                  ]
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListBookNyt(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.movie,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Film',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: GoogleFonts.ptSerif(textStyle: TextStyle(fontWeight: FontWeight.w500)).fontFamily,
                      ),
                    ),
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
