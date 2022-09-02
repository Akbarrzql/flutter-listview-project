import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('World '),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
            child: Row(
                children: <Widget>[
                  Icon(
                    Icons.public,
                    color: Colors.black,
                  ),
                  SizedBox(
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Bisnis'),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.business,
                    color: Colors.black,
                  ),
                  SizedBox(
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Enterainment'),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.movie,
                    color: Colors.black,
                  ),
                  SizedBox(
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Sains'),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.biotech,
                      color: Colors.black,
                    ),
                    SizedBox(
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Kesehatan'),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.health_and_safety,
                      color: Colors.black,
                    ),
                    SizedBox(
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Olah Raga'),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.sports_baseball,
                      color: Colors.black,
                    ),
                    SizedBox(
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Teknologi'),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.developer_board,
                      color: Colors.black,
                    ),
                    SizedBox(
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Buku'),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.book,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Buku',
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Magazine'),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.menu_book,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Magazine',
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
