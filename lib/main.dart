import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluro ',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fluro package"),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            ListTile(
                hoverColor: Colors.green,
                focusColor: Colors.blue,
                title: Text("Home work"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return HomeWork();
                    }),
                  );
                }),
            ListTile(
                hoverColor: Colors.green,
                focusColor: Colors.blue,
                title: Text("Album"),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Albumst();
                  }));
                }),
          ],
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.green,
          child: Text("учимся навигации"),
        ),
      ),
    );
  }
}

class HomeWork extends StatefulWidget {
  HomeWork({Key key}) : super(key: key);

  @override
  _HomeWorkState createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Страница Home'),
    );
  }
}

class Albumst extends StatefulWidget {
  Albumst({Key key}) : super(key: key);

  @override
  _Albumst createState() => _Albumst();
}



class _Albumst extends State<Albumst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data'),),
      body:  Container(
              child: Center(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/artist.json'),
              builder: (context, snapshot) {
                // Decode the JSON
                var newData = json.decode(snapshot.data.toString());

                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 32, bottom: 32, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Akiw()));
                                  },
                                  child: Text(
                                    newData[index]['name'],
                                  
                                    
                                  ),
                                ),
                               
                              ],
                            ),
                            //SizedBox(width: 20),
                            
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: newData == null ? 0 : newData.length,
                );
              },
            ),
          ),
      )
    );
  }
}


class Akiw extends StatefulWidget {
  Akiw({Key key}) : super(key: key);

  @override
  _AkiwState createState() => _AkiwState();
}

class _AkiwState extends State<Akiw> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("akiw"),
    );
  }
}