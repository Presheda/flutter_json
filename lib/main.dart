import 'dart:convert';

import 'package:flutter/material.dart';

void main() =>
    runApp(new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.teal
      ),
      home: new HomePage(),
    ));


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    // TODO: implement createState
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {

  List data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json App"),
      ),

      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString("load_json/person.json"),
            builder: (context, snapshot) {
              var myData = jsonDecode(snapshot.data.toString());

              return new ListView.builder(

                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("Name: " + myData[index]["name"]),
                        new Text("Age: " + myData[index]["age"]),
                        new Text("Height: " + myData[index]["height"]),
                        new Text("Hair Color: " + myData[index]["hair_color"]),
                        new Text("Gender: " + myData[index]["gender"]),
                        ],
                    ),
                  );
                },
                itemCount: myData == null ? 0 : myData.length,
              );
            },
          ),
        ),
      ),
    );
  }
}