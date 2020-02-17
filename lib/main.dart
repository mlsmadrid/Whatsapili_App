import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();
  var num = "22234113763";
  var text = "slm";

  @override
  initState() {
    super.initState();
  }

  void whatsAppOpen() async {
    var whatsUrl ="whatsapp://send?phone=$num&text=$text";
    await canLaunch(whatsUrl)? launch(whatsUrl):print("Not Installed");

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Whatsapili'),
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
        body: Wrap(
          children: <Widget>[
            Image(
              image: AssetImage('images/whatsapili.png'),
            ),
            Container(
              child: Center(
                  child: Text("Whatsapili it's a simple app\nthat's help you to text\nanyone directly without\nsaving his\nnumber",
                  )
              ),
            ),
            Container(
              // padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.fromLTRB(2.0, 30.0, 2.0, 2.0),
              child: Card(
                child: Form(
                  key: formKey,
                  child: Wrap(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Number",
                          hintText: "You must add the number with the country code but without + or 00",
                        ),
                        onSaved: (input) => num = input,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Message",
                          hintText: "If you want you can write your message directly from here !",
                        ),
                        onSaved: (input) => text = input,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                child: Center(
                  child: FlatButton(
                    child: Text("Direct message"),
                    onPressed: () {
                      formKey.currentState.save();
                      whatsAppOpen();
                    },
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}