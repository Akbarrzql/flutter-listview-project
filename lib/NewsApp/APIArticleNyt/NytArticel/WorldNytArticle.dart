import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:listview_project/NewsApp/APIArticleNyt/Model/MovieNytModel.dart';
import 'package:listview_project/NewsApp/APIArticleNyt/NytArticel/DetailNytArticle.dart';

class WorldNytArticle extends StatefulWidget {
  const WorldNytArticle({Key? key}) : super(key: key);

  @override
  State<WorldNytArticle> createState() => _WorldNytArticleState();
}

class _WorldNytArticleState extends State<WorldNytArticle> {

  BookNytModel? bookNytModel;
  bool loading = true;

  void getAllWorld() async {
    setState(() {
      loading = false;
    });
    final res = await http.get(Uri.parse("https://api.nytimes.com/svc/topstories/v2/world.json?api-key=VAGioGV72XjabZyJsHSbThL3m0ha5QIk"));
    print("Response status: ${res.statusCode}");
    bookNytModel = BookNytModel.fromJson(json.decode(res.body.toString()));
    print("article 0 : " + bookNytModel!.results![0].title.toString());
    setState(() {
      loading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllWorld();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'World',
          style: TextStyle(
              fontFamily: GoogleFonts.ptSerif(textStyle: TextStyle(fontWeight: FontWeight.bold)).fontFamily,
              color: Colors.black
          ),
        ),
      ),
      body: loading ? ListView.builder(
        itemCount: bookNytModel!.results!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailNytListArticle(
                    results: bookNytModel!.results![index],
                  ),
                ),
              );
            },
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  //image
                  child: Image.network(
                    bookNytModel!.results![index].multimedia![0].url.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                  //title
                  child: Text(
                    bookNytModel!.results![index].title.toString(),
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: GoogleFonts.ptSerif(color: Colors.black, fontWeight: FontWeight.bold).fontFamily,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, left: 10, right: 10,bottom: 10),
                  //description
                  child: Text(
                    bookNytModel!.results![index].abstract.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 10,
                  indent: 13,
                  endIndent: 13,
                ),
              ],
            ),
          );
        },
      ) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
