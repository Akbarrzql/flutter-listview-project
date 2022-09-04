import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import '../DetailHeadlines.dart';

class Technology extends StatefulWidget {
  const Technology({Key? key}) : super(key: key);

  @override
  State<Technology> createState() => _TechnologyState();
}

class _TechnologyState extends State<Technology> {

  bool loading = false;
  List _get = [];
  final date = new DateFormat('d MMMM y hh:mm');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
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
          'Teknologi',
          style: TextStyle(
              fontFamily: GoogleFonts.ptSerif(textStyle: TextStyle(fontWeight: FontWeight.bold)).fontFamily,
              color: Colors.black
          ),
        ),
      ),
      body: loading ? ListView.builder(
        itemCount: _get.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailHeadlines(
                    title: _get[index]['title'],
                    url: _get[index]['url'],
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  //image
                  child: Image.network(
                    _get[index]['urlToImage'].toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                  //title
                  child: Text(
                    _get[index]['title'].toString(),
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: GoogleFonts.ptSerif(color: Colors.black, fontWeight: FontWeight.bold).fontFamily,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, left: 10, right: 10,bottom: 10),
                  //description
                  child: Text(
                    _get[index]['description'].toString(),
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, left: 10),
                  //dateFormated and time hour ago
                  child: Text(
                    date.format(DateTime.parse(_get[index]['publishedAt'].toString())),
                    style: TextStyle(
                        fontSize: 13,
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

  Future _getData() async {
    setState(() {
      loading = false;
    });
    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=id&category=technology&apiKey=89bdbcf124124d558e1e06af6c91faae"));
      // return jsonDecode(response.body);

      // untuk cek data
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _get = data['articles'];
          loading = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
