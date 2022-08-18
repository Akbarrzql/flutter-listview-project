import 'package:flutter/material.dart';

import 'SpanyolModel.dart';

class DetailListFootball extends StatefulWidget {
  DetailListFootball({Key? key, this.teams}) : super(key: key);
  Teams? teams;


  @override
  State<DetailListFootball> createState() => _DetailListFootballState();
}

class _DetailListFootballState extends State<DetailListFootball> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail List Football"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(widget.teams!.strTeamBadge.toString()),
                SizedBox(height: 10,),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Name Team : ", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(widget.teams!.strTeam.toString()),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Stadium : ", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(widget.teams!.strStadium.toString()),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Description : ", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(widget.teams!.strDescriptionEN.toString()),
                        ],
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
