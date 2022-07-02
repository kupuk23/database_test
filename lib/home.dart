// ignore_for_file: prefer_const_constructors

import 'package:database_test/widget/centered_view.dart';
import 'package:database_test/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  final ValueChanged<String> onTapped;
  const HomePage({Key? key, required this.onTapped}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _textFormController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScrollController con = ScrollController();
    double titleSize = 80;
    String inputID = '';
    return Scaffold(
      body: CenteredView(
          child: Column(
        children: [
          NavBar(),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 4 / 5,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 700,
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 100,
                          child: Expanded(
                            child: Form(
                              key: formKey,
                              child: TextFormField(
                                controller: _textFormController,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp('[0-9]').hasMatch(value)) {
                                    return "Enter ID Number Correctly";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'ID',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.yellowAccent)),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                print(_textFormController.text);
                                widget.onTapped(_textFormController.text);
                              }
                            }, //
                            child: Text("Get Result"))
                      ],
                    ),
                  ]),
            ),
          )
        ],
      )),
    );
  }
}
