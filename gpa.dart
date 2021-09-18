import 'package:flutter/material.dart';
import 'dart:async';

class GPAcalc extends StatefulWidget {
  @override
  GPAcalcstate createState() => new GPAcalcstate();
}

class GPAcalcstate extends State<GPAcalc> {
  List<String> _items =
      ['A+', 'A', 'B+', 'B', 'B-', 'C+', 'C', 'D', 'F'].toList();
  List<String> _itemsCp = ['1', '2', '3', '4', '5', '6'].toList();
  var _selection = [];
  var _selectionCp = [];
  var list = [];
  var n = 0;
  dynamic res = 0.0;
  double opacit = 0.0;
  TextEditingController subjects = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    dynamic sogxc = 0, soc = 0;
    var textFields = <Widget>[];
    bool safeToNavigate = true;
    textFields.add(
      Container(
        margin: EdgeInsets.only(bottom: 30),
        child: new Row(children: [
          new Column(children: [
            Container(
                margin: EdgeInsets.only(left: 50, right: 20),
                padding: EdgeInsets.only(left: 20),
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  onChanged: (String str) {
                    setState(() {

                    });
                  },
                  keyboardType: TextInputType.number,
                  controller: subjects,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Number of Subjects"),
                ))
          ]),
          new Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (subjects.text == "")
                        n = 0;
                      else {
                        n = int.parse(subjects.text);
                      }
                      _selection = new List<String>()..length = n;
                      _selectionCp = new List<String>()..length = n;
                      list = new List<int>.generate(n, (i) => i);
                      if (n != 0) {
                        opacit = 1;
                      } else {
                        opacit = 0;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.add_box_rounded,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
    textFields.add(
      new Row(children: [
        new Padding(
          padding: new EdgeInsets.only(left: 130.0),
        ),
        new Column(children: [
          Opacity(
            opacity: opacit,
            child: new Text(
              "Grade",
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
          ),
        ]),
        new Padding(
          padding: new EdgeInsets.only(left: 70),
        ),
        new Column(
          children: [
            Opacity(
              opacity: opacit,
              child: new Text(
                "Credit Hours",
                overflow: TextOverflow.ellipsis,
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
            ),
          ],
        ),
        new Padding(
          padding: new EdgeInsets.only(bottom: 25.0),
        ),
      ]),
    );
    list.forEach((i) {
      textFields.add(
        new Column(
          children: [
            Card(
              color: Colors.blue[100],
              child: new Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        "    Subject ${i + 1} :",
                        style: new TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.all(10.0),
                    ),
                    new DropdownButton<String>(
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      hint: new Text(
                        "Select grade",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.normal),
                      ),
                      value: _selection[i],
                      items: _items.map((String item) {
                        return new DropdownMenuItem<String>(
                          value: item,
                          child: new Text(
                            item,
                            textAlign: TextAlign.center,
                          ),
                        );
                      }).toList(),
                      onChanged: (s) {
                        setState(() {
                          _selection[i] = s;
                        });
                      },
                    ),
                    new Padding(
                      padding: new EdgeInsets.all(35.0),
                    ),
                    new DropdownButton<String>(
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      hint: new Text(
                        "0",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.normal),
                      ),
                      value: _selectionCp[i],
                      items: _itemsCp.map((String items) {
                        return new DropdownMenuItem<String>(
                          value: items,
                          child: new Text(
                            items,
                            textAlign: TextAlign.center,
                          ),
                        );
                      }).toList(),
                      onChanged: (s) {
                        setState(() {
                          _selectionCp[i] = s;
                        });
                      },
                    ),
                  ]),
            ),
          ],
        ),
      );
    });
    textFields.add(Opacity(
      opacity: opacit,
      child: new Container(
        margin: EdgeInsets.only(left: 50, right: 50, top: 40, bottom: 30),
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: RaisedButton(
          textColor: Colors.white,
          color: Colors.blue[400],
          onPressed: () {
            for (int i = 0; i < n; i++) {
              if (_selectionCp[i] == null) {
                safeToNavigate = false;
                continue;
              }
              if (_selection[i] == null) {
                safeToNavigate = false;
                continue;
              }
              dynamic r = int.parse(_selectionCp[i]);
              dynamic gp = calculate(_selection[i]);
              dynamic cp = r;
              dynamic gxc = gp * cp;
              sogxc += gxc;
              soc += cp;
            }
            res = sogxc / soc;
            String res1=res.toStringAsFixed(2);
            if (safeToNavigate) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                        child: Container(
                          height: 280,
                          width: 200,
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.all(30),
                                  child: Text("Your Result Details",style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),)),
                              Row(
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: Text("Total Subjects : ",style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black
                                        ),),
                                      ),

                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: Text("Your GPA : ",style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black
                                        ),),
                                      ),
                                    ],
                                  ),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: Text(n.toString(),style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black
                                        ),),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: Text(res1.toString(),style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black
                                        ),),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 15),
                                width: 150,

                                child: RaisedButton(
                                  color: Colors.blue[500],
                                  textColor: Colors.white,
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"),
                                ),
                              )
                            ],

                          ),
                        ),
                      ));
            } else {
              alert();
            }
          },
          child: Text(
            "Calculate",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ));

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GPA calculator"),
        backgroundColor: Colors.blue[400],
      ),
      backgroundColor: Colors.orange[100],
      body: new Container(
        decoration: new BoxDecoration(
            border: new Border(
          top: BorderSide(width: 30, color: Colors.transparent),
          left: BorderSide(width: 10, color: Colors.transparent),
          right: BorderSide(width: 10, color: Colors.transparent),
          bottom: BorderSide(width: 30, color: Colors.transparent),
        )),
        child: new ListView(
          children: textFields,
        ),
      ),
    );
  }

  dynamic calculate(var a) {
    if (a == "A+") return 4;
    if (a == "A") return 3.70;
    if (a == "B+") return 3.4;
    if (a == "B") return 3;
    if (a == "B-") return 2.5;
    if (a == "C+") return 2;
    if (a == "C") return 1.5;
    if (a == "D") return 1;
    if (a == "F") return 0;
    return 0;
  }

  Future<Null> alert() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Rewind and remember'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('You have done something terrible.'),
                new Text('Go back and reflect on your mistakes.'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('give me one more chance'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
