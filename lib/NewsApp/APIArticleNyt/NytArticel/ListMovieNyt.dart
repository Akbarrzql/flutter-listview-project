import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:listview_project/NewsApp/APIArticleNyt/NytArticel/DetailNytArticle.dart';
import 'dart:convert';

import 'package:listview_project/NewsApp/APIArticleNyt/Model/WorldNytModel.dart';

class ListBookNyt extends StatefulWidget {
  const ListBookNyt({Key? key}) : super(key: key);

  @override
  State<ListBookNyt> createState() => _ListBookNytState();
}

class _ListBookNytState extends State<ListBookNyt> {

  BookNytModel? bookNytModel;
  bool isLoading = true;

  void getAllBook() async {
    setState(() {
      isLoading = false;
    });
    final res = await http.get(Uri.parse("https://api.nytimes.com/svc/topstories/v2/movies.json?api-key=VAGioGV72XjabZyJsHSbThL3m0ha5QIk"));
    print("Response status: ${res.statusCode}");
    bookNytModel = BookNytModel.fromJson(json.decode(res.body.toString()));
    print("article 0 : " + bookNytModel!.results![0].title.toString());
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllBook();
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
          'Artikel Movie',
          style: TextStyle(
              fontFamily: GoogleFonts.ptSerif(textStyle: TextStyle(fontWeight: FontWeight.bold)).fontFamily,
              color: Colors.black
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: isLoading ? ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: bookNytModel!.results!.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailNytListArticle(
                    results: bookNytModel!.results![index],
                  )));
                },
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.all(5),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(bookNytModel!.results![index].imageurl.toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bookNytModel!.results![index].title.toString(),
                                style: TextStyle(
                                    fontFamily: GoogleFonts.ptSerif().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ) : Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
