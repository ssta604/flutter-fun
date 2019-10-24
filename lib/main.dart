import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:random_names/random_names.dart';

void main() => runApp(MyHomePage(
      title: 'Card ListView POC',
    ));

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData.dark(),
//      home: MyHomePage(title: 'Card ListViewe POC'),
//    );
//  }
//}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final randomNames = generateRandomNames(500);
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          actions: <Widget>[
            FlatButton(
              child: Text(darkMode ? 'Light' : 'Dark'),
              onPressed: () {
                setState(() {
                  darkMode = !darkMode;
                });
              },
            ),
          ],
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView(
            children: List.generate(500, (i) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Html(
                      data: '''
                      
                    <h1>${randomNames[i]} <img width="100px" src=https://i.pravatar.cc/300/$i" /></h1>
                    <hr/>
                    This is <mark>marked</mark> text!
                    <b>BOLD</b>
                    <font color="red">RED?</font>
                    <u>Underlined</u>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lobortis tellus ac dolor volutpat, sit amet sollicitudin lectus gravida. Maecenas posuere, tellus sit amet 
                    laoreet vehicula, sem dui convallis ipsum, non consectetur nisl erat nec turpis. Vivamus lacus elit, auctor ac metus accumsan, lobortis aliquam mauris. 
                    Curabitur bibendum scelerisque neque, in finibus tellus feugiat sed. Aliquam volutpat rhoncus orci non luctus. Cras volutpat interdum risus, quis mattis ex finibus nec.
                    Vivamus sagittis diam a pellentesque efficitur. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla facilisi. 
                    Donec mattis sed metus eu molestie. Fusce et ligula enim.
                    <a href="https://google.ca/">Google Search</a>
                    ''',
                      useRichText: true,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
