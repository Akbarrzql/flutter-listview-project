import 'package:flutter/material.dart';
import 'package:listview_project/API/ListAllFootbal.dart';
import 'package:url_launcher/url_launcher.dart';

import 'SpanyolModel.dart';

class DetailListFootball extends StatefulWidget {
  DetailListFootball({Key? key, this.teams}) : super(key: key);
  Teams? teams;


  @override
  State<DetailListFootball> createState() => _DetailListFootballState();
}

class _DetailListFootballState extends State<DetailListFootball> {

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1E1E1E),
      appBar: AppBar(
        title: Text("Detail List Football"),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(widget.teams!.strTeamBadge.toString()),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.teams!.strTeam.toString(), style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(height: 3,),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Stadium : ", style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFFDDDDDD)),),
                        Text(widget.teams!.strStadium.toString(), style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFFDDDDDD))),
                      ],
                    ),
                  ),
                  SizedBox(height: 3,),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("league : ", style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFFDDDDDD)),),
                        Text(widget.teams!.strLeague.toString(), style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFFDDDDDD))),
                      ],
                    ),
                  ),
                  SizedBox(height: 3,),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              var myUrl = "https://" + widget.teams!.strInstagram.toString(); _launchInBrowser(myUrl);
                              // _launchInBrowser(widget.teams!.strWebsite.toString());
                            });
                          },
                          child: Image.asset('assets/images/instagram.png', width: 50, height: 50,),
                        ),
                        SizedBox(width: 5,),
                        InkWell(
                          onTap: () {
                            setState(() {
                              var myUrl = "https://" + widget.teams!.strTwitter.toString(); _launchInBrowser(myUrl);
                              // _launchInBrowser(widget.teams!.strWebsite.toString());
                            });
                          },
                          child: Image.asset('assets/images/twitter.png', width: 50, height: 50,),
                        ),
                        SizedBox(width: 7,),
                        InkWell(
                          onTap: () {
                            setState(() {
                              var myUrl = "https://" + widget.teams!.strFacebook.toString(); _launchInBrowser(myUrl);
                              // _launchInBrowser(widget.teams!.strWebsite.toString());
                            });
                          },
                          child: Image.asset('assets/images/facebook.png', width: 43, height: 43,),
                        ),
                        SizedBox(width: 5,),
                        InkWell(
                          onTap: () {
                            setState(() {
                              var myUrl = "https://" + widget.teams!.strYoutube.toString(); _launchInBrowser(myUrl);
                              // _launchInBrowser(widget.teams!.strWebsite.toString());
                            });
                          },
                          child: Image.asset('assets/images/youtube.png', width: 50, height: 50,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        DefaultTabController(length: 2, initialIndex: 0, child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10),
                                child: Card(
                                  color: Color(0xFF353535),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Description : ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                        Text(widget.teams!.strDescriptionEN.toString(), style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),),
                                      ],
                                    ),
                                  ),
                                )
                            )
                        ],
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
