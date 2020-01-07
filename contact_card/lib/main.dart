import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: LandingScreen(),
    );
  }
}

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
            ),
            Container(
              child: CircleAvatar(
                radius: width * 0.2,
                backgroundImage: AssetImage('images/cardImage.jpg'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: width / height * 20),
              child: Text(
                "tarunpreet singh",
                style: new TextStyle(
                    fontSize: width / height * 80,
                    color: Colors.white,
                    fontFamily: 'Pacifico'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: width / height * 10),
              child: Text(
                "SOFTWARE DEVELOPER",
                style: new TextStyle(
                  fontSize: width / height * 30,
                  color: Colors.greenAccent.shade100,
                  letterSpacing: width / 100,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Sans',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: width / height * 10),
              height: height * 0.002,
              width: width / 2.5,
              color: Colors.white,
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(
                  vertical: height * 0.05, horizontal: width * 0.2),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                trailing: Text(
                  "+1(437) 241-1459",
                  style: new TextStyle(
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.normal,
                    fontSize: height * 0.02,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin:
                  EdgeInsets.symmetric(vertical: 0, horizontal: width * 0.2),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                trailing: Text(
                  "tarun16@gmail.com",
                  style: new TextStyle(
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.normal,
                    fontSize: height * 0.02,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
