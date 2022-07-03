// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'classes/class.dart';

class ResultsPage extends StatefulWidget {
  final String resultId;

  const ResultsPage({Key? key, required this.resultId}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  String name = "";
  int values = 10;
  int dom1 = 1;
  int dom2 = 3;
  int dom3 = 6;
  int dom4 = 9;
  List<int> stdScore = [];
  List<int> faset2 = [];
  final db = FirebaseFirestore.instance;
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

  Stream<List> getData() async* {
    db.collection('users2').get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc['id'] == int.tryParse(widget.resultId)) {
          // faset.add(int.parse(doc['id']));
          try {
            stdScore.add(doc['stdScore1']);
            stdScore.add(doc['stdScore1']);
            stdScore.add(doc['stdScore2']);
            stdScore.add(doc['stdScore3']);
            stdScore.add(doc['stdScore4']);
            stdScore.add(doc['stdScore5']);
            stdScore.add(doc['stdScore6']);
            stdScore.add(doc['stdScore7']);
            stdScore.add(doc['stdScore8']);
            stdScore.add(doc['stdScore9']);
            print('faset is : $stdScore');
            break;
          } catch (err) {
            print("faset err is $err");
            // faset.clear();
          }
        }
      }
    });
    print("faset before out $stdScore");
    yield stdScore;
  }

  @override
  void initState() {
    super.initState();
    this.getData();
    print('ID IS ${widget.resultId}');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementfasetScore method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Title(
      title: "asd",
      color: Colors.black,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the ResultsPage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            widget.resultId,
            style: TextStyle(color: Colors.black),
          ),
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
                    height: MediaQuery.of(context).size.height * 1.5, // - 500,
                    width:
                        MediaQuery.of(context).size.width * 0.95, //1920 - 500,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: db.collection('users2').snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                                child:
                                    Center(child: CircularProgressIndicator()));
                          }
                          for (var doc in snapshot.data!.docs) {
                            if (doc['id'] == int.tryParse(widget.resultId)) {
                              // faset.add(int.parse(doc['id']));
                              try {
                                name = doc['name'];
                                stdScore.add(doc['stdscore1']);
                                stdScore.add(doc['stdscore1']);
                                stdScore.add(doc['stdscore2']);
                                stdScore.add(doc['stdscore3']);
                                stdScore.add(doc['stdscore4']);
                                stdScore.add(doc['stdscore5']);
                                stdScore.add(doc['stdscore6']);
                                stdScore.add(doc['stdscore7']);
                                stdScore.add(doc['stdscore8']);
                                stdScore.add(doc['stdscore9']);
                                stdScore.add(doc['stdscore10']);
                                stdScore.add(doc['stdscore11']);
                                stdScore.add(doc['stdscore12']);
                                stdScore.add(doc['stdscore13']);
                                stdScore.add(doc['stdscore14']);
                                stdScore.add(doc['stdscore15']);
                                print('faset is : $stdScore');
                                break;
                              } catch (err) {
                                print("faset err is $err");
                                stdScore.clear();
                              }
                            } else {
                              stdScore.clear();
                            }
                          }
                          if (stdScore.isEmpty) {
                            return Container(
                              child: Text("no Data"),
                            );
                          }
                          return Container(
                            margin: EdgeInsets.all(10),
                            color: Colors.purple.withOpacity(0.1),
                            height: MediaQuery.of(context).size.height *
                                0.9, // - 500,
                            width: MediaQuery.of(context).size.width *
                                0.9, //1920 - 500,
                            child: Column(
                              children: [
                                Text('Name :  $name'),
                                FasetChart(
                                    fasetScore: stdScore,
                                    dom1: dom1,
                                    dom2: dom2,
                                    dom3: dom3,
                                    dom4: dom4),
                              ],
                            ),
                          );
                        }))),
          ),
        ),
      ),
    );
  }
}

class FasetChart extends StatelessWidget {
  const FasetChart({
    Key? key,
    required this.fasetScore,
    required this.dom1,
    required this.dom2,
    required this.dom3,
    required this.dom4,
  }) : super(key: key);

  final List<int> fasetScore;
  final int dom1;
  final int dom2;
  final int dom3;
  final int dom4;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[0]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[1]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[2]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[3]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[4]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[5]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[6]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[7]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[8]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[9]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[10]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[11]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[12]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[13]),
      SizedBox(
        height: 20,
      ),
      rowTable(fasetScore: fasetScore[14]),
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
    ]);
  }
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
