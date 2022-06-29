// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'classes/class.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int faset1Score = 1;
  int faset2Score = 4;
  int faset3Score = 6;
  int faset4Score = 2;
  int faset5Score = 8;
  int faset6Score = 2;
  int faset7Score = 1;
  int faset8Score = 9;
  int faset9Score = 8;
  int values = 10;
  int dom1 = 1;
  int dom2 = 3;
  int dom3 = 6;
  int dom4 = 9;

  GlobalKey _tableKey = GlobalKey();
  late double tableWidth;
  late double tableHeight;

  void _incrementfasetScore() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // faset1Score without calling setState(), then the build method would not be
    });
  }

  _getSizes() {
    final RenderBox renderBoxRed =
        _tableKey.currentContext!.findRenderObject() as RenderBox;
    final sizeRed = renderBoxRed.size;
    print("Size of Red: $sizeRed ");
  }

  _getPositions() {
    final RenderBox renderBoxRed =
        _tableKey.currentContext!.findRenderObject() as RenderBox;
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
    //print("POSITION of Red: $positionRed ");
  }

  _afterLayout(_) {
    _getPositions();
    _getSizes();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final user = <String, dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    };

    //PENTING
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc['first'] == "Ada") {
          final docID = doc.id;
          print(docID);
        }
      });
    });

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementfasetScore method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Expanded(
          child: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            color: Color.fromARGB(255, 220, 189, 189),
            height: MediaQuery.of(context).size.height * 0.95, // - 500,
            width: MediaQuery.of(context).size.width * 0.95, //1920 - 500,
            child: Container(
              margin: EdgeInsets.all(10),
              color: Colors.purple.withOpacity(0.1),
              height: MediaQuery.of(context).size.height * 0.9, // - 500,
              width: MediaQuery.of(context).size.width * 0.9, //1920 - 500,
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                rowTable(fasetScore: faset1Score),
                SizedBox(
                  height: 20,
                ),
                rowTable(fasetScore: faset2Score),
                SizedBox(
                  height: 20,
                ),
                rowTable(fasetScore: faset3Score),
                SizedBox(
                  height: 20,
                ),
                rowTable(fasetScore: faset4Score),
                SizedBox(
                  height: 20,
                ),
                rowTable(fasetScore: faset5Score),
                SizedBox(
                  height: 20,
                ),
                rowTable(fasetScore: faset6Score),
                SizedBox(
                  height: 20,
                ),
                rowTable(fasetScore: faset7Score),
                SizedBox(
                  height: 20,
                ),
                rowTable(fasetScore: faset8Score),
                SizedBox(
                  height: 20,
                ),
                rowTable(fasetScore: faset9Score),
                SizedBox(
                  height: 100,
                ),
                Stack(children: [
                  BarChartCategories(),
                  Center(
                    child: Container(
                      width: 500,
                      // MediaQuery.of(context).size.width *
                      // (1400 / MediaQuery.of(context).size.width),
                      //color: Colors.grey.withOpacity(0.4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                          ),
                          DottedLine(
                            direction: Axis.vertical,
                            lineLength: 265,
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          DottedLine(
                            direction: Axis.vertical,
                            lineLength: 265,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      BarChartRow(
                        values: dom1,
                      ),
                      BarChartRow(
                        values: dom2,
                      ),
                      BarChartRow(
                        values: dom3,
                      ),
                      BarChartRow(
                        values: dom4,
                      ),
                    ],
                  ),
                ]),
              ]),
            ),
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          db.collection("users").add(user).then((DocumentReference doc) =>
              print('DocumentSnapshot added with ID: ${doc.id}'));
        }),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}

class BarChartCategories extends StatelessWidget {
  const BarChartCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 20,
        width: 400,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 70,
            ),
            Text("Low"),
            SizedBox(
              width: 100,
            ),
            Text("Medium"),
            SizedBox(
              width: 100,
            ),
            Text("High")
          ],
        ),
      ),
    );
  }
}

class BarChartRow extends StatelessWidget {
  BarChartRow({
    Key? key,
    required int values,
  })  : _value = values,
        super(key: key);

  final int _value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("BarData"),
        Container(
          height: 70,
          width: 2,
          color: Colors.black,
        ),
        Container(
          color: chooseColor(_value),
          height: 40,
          width: scoreToBarLength(_value).toDouble(),
        ),
        Container(
          height: 40,
          width: 450 - scoreToBarLength(_value).toDouble(),
        )
      ],
    );
  }
}

int scoreToBarLength(int score) {
  switch (score) {
    case 1:
      return 50;
      break;
    case 2:
      return 100;
      break;
    case 3:
      return 150;
      break;
    case 4:
      return 200;
      break;
    case 5:
      return 250;
      break;
    case 6:
      return 300;
      break;
    case 7:
      return 350;
      break;
    case 8:
      return 400;
      break;
    case 9:
      return 450;
      break;
    default:
      return 0;
  }
}

MaterialColor chooseColor(score) {
  if (score < 4)
    return Colors.red;
  else if (score < 7)
    return Colors.blue;
  else
    return Colors.green;
}

class rowTable extends StatelessWidget {
  const rowTable({
    Key? key,
    required int fasetScore,
  })  : _fasetScore = fasetScore,
        super(key: key);

  final int _fasetScore;
  final Color fasetColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Data 1"),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 20,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(),
            color: _fasetScore == 1 ? fasetColor : null,
          ),
        ),
        Container(
          height: 20,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(),
            color: _fasetScore == 2 ? fasetColor : null,
          ),
        ),
        Container(
          height: 20,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(),
            color: _fasetScore == 3 ? fasetColor : null,
          ),
        ),
        Container(
          height: 20,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(),
            color: _fasetScore == 4 ? fasetColor : null,
          ),
        ),
        Container(
          height: 20,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(),
            color: _fasetScore == 5 ? fasetColor : null,
          ),
        ),
        Container(
          height: 20,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(),
            color: _fasetScore == 6 ? fasetColor : null,
          ),
        ),
        Container(
          height: 20,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(),
            color: _fasetScore == 7 ? fasetColor : null,
          ),
        ),
        Container(
          height: 20,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(),
            color: _fasetScore == 8 ? fasetColor : null,
          ),
        ),
        Container(
          height: 20,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(),
            color: _fasetScore == 9 ? fasetColor : null,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text("Data 1 Right"),
      ],
    );
  }
}
