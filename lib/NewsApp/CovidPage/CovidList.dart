import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class CovidList extends StatefulWidget {
  const CovidList({Key? key}) : super(key: key);

  @override
  State<CovidList> createState() => _CovidListState();
}

class _CovidListState extends State<CovidList> {
  bool loading = false;
  List _get = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: loading ? ListView.builder (
          itemCount: _get.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
              },
              child: Card(
                color: Color(0xFF2e343b),
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      //image
                      child: Text(
                        _get[index]['key'],
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.ptSerif().fontFamily,
                        color: Colors.white,
                        ),
                        ),
                      ),
                    Divider(
                      color: Colors.white,
                      height: 10,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Column(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: <Widget>[
                                          Text("Terkonfirmasi ", style: TextStyle(color: Colors.white, fontSize: 14,),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(_get[index]['jumlah_kasus'].toString(), style: TextStyle(color: Colors.yellow, fontSize: 14,))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 58),
                                            child: Column(
                                              children: <Widget>[
                                                Text("Sembuh", style: TextStyle(color: Colors.white, fontSize: 14,),),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(_get[index]['jumlah_sembuh'].toString(), style: TextStyle(color: Colors.green, fontSize: 14,))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 66),
                                            child: Column(
                                              children: <Widget>[
                                                Text("Meninggal", style: TextStyle(color: Colors.white, fontSize: 14,),),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(_get[index]['jumlah_meninggal'].toString(), style: TextStyle(color: Colors.red, fontSize: 14,))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                      ),
          ),
            ],
            )
              ),
            );
          },
        ) : Center(child: CircularProgressIndicator(),),
      ),
    );
  }


  Future _getData() async {
    setState(() {
      loading = false;
    });
    try {
      final response = await http.get(Uri.parse(
          "https://data.covid19.go.id/public/api/prov.json"));
      // return jsonDecode(response.body);

      // untuk cek data
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _get = data['list_data'];
          loading = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
