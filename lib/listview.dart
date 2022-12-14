import 'package:flutter/material.dart';
import 'package:listview_project/NameModel.dart';


class listview extends StatefulWidget {
  const listview({Key? key}) : super(key: key);

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {

  List<NameModel> data = [
    NameModel("Adhanafi Ilyas", "AI", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Ahmad Aziz", "AA", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Akbar Rizqullah", "AR", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Alwan Athallah", "AA", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Amri Iqra", "AI", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Sejati Adli", "SA", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Andika Setya", "AS", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Antariksa Kusuma", "AK", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Azzra Rienov", "AR", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Bayu Septian", "BS", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Bhre Nabil", "BN", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Bimo Adi", "BA", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Daffa Syauqi", "DS", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Danar Gading", "DG", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Dimas Bagus", "DB", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Firdaus Hafidz", "FH", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Hegel Al Rafli", "HAR", "Pengembang Perangkat Lunak Dan Gim"),
    NameModel("Hibatullah Fawwaz", "HF", "Pengembang Perangkat Lunak Dan Gim"),
  ];

  Widget avatar(int index){
    return CircleAvatar(
      radius: 24,
      child: Text(
        data[index].kodeName,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget textData(int index){
    return Expanded(child: Container(
      margin: EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            data[index].name,
            style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            child: Text(data[index].jurusan),
          ),
        ],
      ),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Listview"),),
      body: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: data.length,
        itemBuilder: (buildContext, index) {
          return GestureDetector(
            onTap: () => showDialog(context: context, builder: (BuildContext context)=> AlertDialog(
              title: Text("Hapus Kontak"),
              content: Text("Anda yakin ingin menghapus kontak ${data[index].name}?"),
              actions: <Widget>[
                ElevatedButton(
                  child: Text("Ya"),
                  onPressed: (){
                    setState(() {
                      data.removeAt(index);
                    });
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  child: Text("Tidak"),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            )),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  avatar(index),
                  textData(index),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}




