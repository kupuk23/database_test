// ignore_for_file: prefer_const_constructors

import 'package:database_test/widget/centered_view.dart';
import 'package:database_test/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScrollController con = ScrollController();
    double titleSize = 80;
    var inputID;
    return Scaffold(
      body: Scrollbar(
        scrollbarOrientation: ScrollbarOrientation.bottom,
        controller: con,
        child: SingleChildScrollView(
          controller: con,
          scrollDirection: Axis.horizontal,
          child: CenteredView(
              child: Column(
            children: [
              NavBar(),
              Expanded(
                child: Row(children: [
                  Container(
                    width: 700,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Individual Assesment Report",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              height: 0.9,
                              fontSize: titleSize),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
                          style: TextStyle(
                            fontSize: 30,
                            height: 1.7,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      width: 20,
                      child: TextField(
                        controller: inputID,
                        onChanged: (text) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Full Name',
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                      onPressed: () {},
                      child:
                          Container(height: 50, width: 40, child: Text("'asd")))
                ]),
              )
            ],
          )),
        ),
      ),
    );
  }
}
