import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uongpacalc/gpa.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UON GPA - CGPA Calculator"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 150,
                width: 250,
                child: Image.asset("assets/uon.jpg", fit: BoxFit.fill,),
              ),
            ),
            Center(
              child: Container(
                width: 270,
                padding: EdgeInsets.only(
                    top: 8, bottom: 8, left: 50, right: 50),
                decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                      bottom: BorderSide(width: 2, color: Colors.black),
                      right: BorderSide(width: 2, color: Colors.black),
                      left: BorderSide(width: 2, color: Colors.black),
                      top: BorderSide(width: 2, color: Colors.black),
                    )),
                margin: EdgeInsets.only(top: 50),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => GPAcalc()));
                  },
                  child: Text("CALCULATE GPA", style: TextStyle(
                    color: Colors.white,
                    fontSize: 17, fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 270,
                padding: EdgeInsets.only(
                    top: 8, bottom: 8, left: 50, right: 50),
                decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                      bottom: BorderSide(width: 2, color: Colors.black),
                      right: BorderSide(width: 2, color: Colors.black),
                      left: BorderSide(width: 2, color: Colors.black),
                      top: BorderSide(width: 2, color: Colors.black),
                    )),
                margin: EdgeInsets.only(top: 25),
                child: TextButton(
                  onPressed: () {},
                  child: Text("CALCULATE CGPA", style: TextStyle(
                    color: Colors.white,
                    fontSize: 17, fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 270,

                padding: EdgeInsets.only(
                    top: 8, bottom: 8, left: 50, right: 50),
                decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                      bottom: BorderSide(width: 2, color: Colors.black),
                      right: BorderSide(width: 2, color: Colors.black),
                      left: BorderSide(width: 2, color: Colors.black),
                      top: BorderSide(width: 2, color: Colors.black),
                    )),
                margin: EdgeInsets.only(top: 25),
                child: TextButton(
                  onPressed: () {},
                  child: Text("GRADE LIST", style: TextStyle(
                    color: Colors.white,
                    fontSize: 17, fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 270,

                padding: EdgeInsets.only(
                    top: 8, bottom: 8, left: 50, right: 50),
                decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                      bottom: BorderSide(width: 2, color: Colors.black),
                      right: BorderSide(width: 2, color: Colors.black),
                      left: BorderSide(width: 2, color: Colors.black),
                      top: BorderSide(width: 2, color: Colors.black),
                    )),
                margin: EdgeInsets.only(top: 25),
                child: TextButton(
                  onPressed: () {},
                  child: Text("CONTACT US", style: TextStyle(
                    color: Colors.white,
                    fontSize: 17, fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 180,
              color: Colors.blue[400],
              child: Column(
                children: [
                  Container(

                    margin: EdgeInsets.only(right: 200),
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage("assets/uon.jpg")),
                      color: Colors.redAccent,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 90, top: 15),
                    child: Text("UON GPA - CGPA Calculator", style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),),),
                  Container(
                    margin: EdgeInsets.only(right: 55, top: 10),
                    child: Text(
                      "Developed by Muhammad Kashif", style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),),),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
