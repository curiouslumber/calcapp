import 'package:calc/counter_bloc.dart';
import 'package:calc/previos_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _counter = 0;
  final counterBloc = CounterBloc();
  final previousBloc = PreviousBloc();

  int k = 0;
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    double y_offset = 1.0;

    String result = "0";
    String previousresult = "";

    bool first = true;

    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(39, 39, 39, 1),
        appBar: AppBar(
          primary: true,
          toolbarHeight: 52.0,
          centerTitle: true,
          title: Text(
            'Cal-c',
            style: TextStyle(fontFamily: 'Times New Roman'),
          ),
          backgroundColor: Color.fromRGBO(39, 39, 39, 1),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Container(
                        color: Color.fromRGBO(27, 27, 27, 1),
                      ),
                      Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.bottomRight,
                              margin: EdgeInsets.all(2.0),
                              padding: EdgeInsets.fromLTRB(0, 0, 16.0, 0),
                              child: StreamBuilder(
                                  stream: previousBloc.previousStream,
                                  builder: (context, snapshot) {
                                    return Text(
                                      previousresult,
                                      style: TextStyle(
                                          fontSize: 35, color: Colors.white),
                                    );
                                  }),
                              //color: Colors.blue,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 4.0, 18.0, 4.0),
                              alignment: Alignment.centerRight,
                              child: StreamBuilder(
                                stream: counterBloc.counterStream,
                                builder: (context, snapshot) {
                                  return Text(
                                    result,
                                    style: TextStyle(
                                        fontSize: 40, color: Colors.white),
                                  );
                                },
                              ),
                              //color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(4.0),
                        color: Color.fromRGBO(45, 45, 45, 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(3.0, 0, 0, 6.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'More',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(70, 70, 70, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(30, 30, 30, 1),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 2.5,
                                              offset: Offset(0, 2.3),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              //color: Colors.green,
                                              child: Text(
                                                'C',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                if (k > 0) k--;
                                                //debugPrint('$k');
                                                String new_result = ' ';
                                                if (k >= 1) {
                                                  for (int i = 0;
                                                      i < (result.length - 1);
                                                      i++) {
                                                    new_result += result[i];
                                                  }
                                                  result = new_result;
                                                  counterBloc.counterSink
                                                      .add(result);
                                                } else if (k == 0) {
                                                  k = 0;
                                                  result = '0';
                                                  first = true;
                                                  counterBloc.counterSink
                                                      .add(result);
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(30, 30, 30, 1),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 2.5,
                                              offset: Offset(0, 2.3),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              //color: Colors.green,
                                              child: Text(
                                                'AC',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                result = "0";
                                                first = true;
                                                k = 0;
                                                counterBloc.counterSink
                                                    .add(result);
                                              },
                                              //  color: Colors.green
                                            ),
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(30, 30, 30, 1),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 2.5,
                                              offset: Offset(0, 2.3),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                if (!first &&
                                                    ((result[result.length -
                                                                1] !=
                                                            '+') &&
                                                        (result[result.length -
                                                                1] !=
                                                            '-') &&
                                                        (result[result.length -
                                                                1] !=
                                                            'x') &&
                                                        (result[result.length -
                                                                1] !=
                                                            '/'))) {
                                                  k++;
                                                  result += '+';
                                                  counterBloc.counterSink
                                                      .add(result);
                                                }
                                              },
                                              // color: Colors.green,
                                              child: Text(
                                                '+',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(30, 30, 30, 1),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 2.5,
                                              offset: Offset(0, 2.3),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // color: Colors.green,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(3.0, 0, 0, 6.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              //color: Colors.green,
                                              child: Text(
                                                '7',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                k++;
                                                if (first) {
                                                  result = 7.toString();
                                                  first = false;
                                                } else {
                                                  result += 7.toString();
                                                }
                                                counterBloc.counterSink
                                                    .add(result);
                                              },
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(38, 38, 38, 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 0.8,
                                                blurRadius: 4,
                                                offset: Offset(0, y_offset),
                                              )
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              //color: Colors.green,
                                              child: Text(
                                                '8',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                k++;
                                                if (first) {
                                                  result = 8.toString();
                                                  first = false;
                                                } else {
                                                  result += 8.toString();
                                                }
                                                counterBloc.counterSink
                                                    .add(result);
                                              },
                                            ),
                                            //color: Colors.green,
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(38, 38, 38, 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 0.8,
                                                blurRadius: 4,
                                                offset: Offset(0, y_offset),
                                              )
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              //color: Colors.green,
                                              child: Text(
                                                '9',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                k++;
                                                if (first) {
                                                  result = 9.toString();
                                                  first = false;
                                                } else {
                                                  result += 9.toString();
                                                }
                                                counterBloc.counterSink
                                                    .add(result);
                                              },
                                            ),
                                            //color: Colors.green,
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(38, 38, 38, 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 0.8,
                                                blurRadius: 4,
                                                offset: Offset(0, y_offset),
                                              )
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                if (first) {
                                                  k++;
                                                  result = '-';
                                                  first = false;
                                                  counterBloc.counterSink
                                                      .add(result);
                                                } else if (!first &&
                                                    ((result[result.length -
                                                                1] !=
                                                            '-') &&
                                                        result[result.length -
                                                                1] !=
                                                            '+' &&
                                                        result[result.length -
                                                                1] !=
                                                            'x' &&
                                                        result[result.length -
                                                                1] !=
                                                            '/')) {
                                                  k++;
                                                  result += '-';
                                                  counterBloc.counterSink
                                                      .add(result);
                                                }
                                              },
                                              // color: Colors.green,
                                              child: Text(
                                                '-',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(30, 30, 30, 1),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 2.5,
                                              offset: Offset(0, 2.3),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // color: Colors.blue,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(3.0, 0, 0, 6.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              //color: Colors.green,
                                              child: Text(
                                                '4',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                k++;
                                                if (first) {
                                                  result = 4.toString();
                                                  first = false;
                                                } else {
                                                  result += 4.toString();
                                                }
                                                counterBloc.counterSink
                                                    .add(result);
                                              },
                                            ),
                                            //color: Colors.green,
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(38, 38, 38, 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 0.8,
                                                blurRadius: 4,
                                                offset: Offset(0, y_offset),
                                              )
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              //color: Colors.green,
                                              child: Text(
                                                '5',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                k++;
                                                if (first) {
                                                  result = 5.toString();
                                                  first = false;
                                                } else {
                                                  result += 5.toString();
                                                }
                                                counterBloc.counterSink
                                                    .add(result);
                                              },

                                              //color: Colors.green,
                                            )
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(38, 38, 38, 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 0.8,
                                                blurRadius: 4,
                                                offset: Offset(0, y_offset),
                                              )
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              //color: Colors.green,
                                              child: Text(
                                                '6',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                k++;
                                                if (first) {
                                                  result = 6.toString();
                                                  first = false;
                                                } else {
                                                  result += 6.toString();
                                                }
                                                counterBloc.counterSink
                                                    .add(result);
                                              },
                                            ),
                                            //color: Colors.green,
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(38, 38, 38, 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 0.8,
                                                blurRadius: 4,
                                                offset: Offset(0, y_offset),
                                              )
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                if (!first &&
                                                    ((result[result.length -
                                                                1] !=
                                                            'x') &&
                                                        result[result.length -
                                                                1] !=
                                                            '+' &&
                                                        result[result.length -
                                                                1] !=
                                                            '-' &&
                                                        result[result.length -
                                                                1] !=
                                                            '/')) {
                                                  k++;
                                                  result += 'x';
                                                  counterBloc.counterSink
                                                      .add(result);
                                                }
                                              },
                                              //color: Colors.green,
                                              child: Text(
                                                'x',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(30, 30, 30, 1),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 2.5,
                                              offset: Offset(0, 2.3),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // color: Colors.blue,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(3.0, 0, 0, 6.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              //color: Colors.green,
                                              child: Text(
                                                '1',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                k++;
                                                if (first) {
                                                  result = 1.toString();
                                                  first = false;
                                                } else {
                                                  result += 1.toString();
                                                }
                                                counterBloc.counterSink
                                                    .add(result);
                                              },

                                              //color: Colors.green,
                                            )
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(38, 38, 38, 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 0.8,
                                                blurRadius: 4,
                                                offset: Offset(0, y_offset),
                                              )
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              //color: Colors.green,
                                              child: Text(
                                                '2',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                k++;
                                                if (first) {
                                                  result = 2.toString();
                                                  first = false;
                                                } else {
                                                  result += 2.toString();
                                                }
                                                counterBloc.counterSink
                                                    .add(result);
                                              },

                                              //color: Colors.green,
                                            )
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(38, 38, 38, 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 0.8,
                                                blurRadius: 4,
                                                offset: Offset(0, y_offset),
                                              )
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              child: Text(
                                                '3',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              // color: Colors.green,
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                k++;
                                                if (first) {
                                                  result = 3.toString();
                                                  first = false;
                                                } else {
                                                  result += 3.toString();
                                                }
                                                counterBloc.counterSink
                                                    .add(result);
                                              },
                                            ),
                                            //color: Colors.green,
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(38, 38, 38, 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 0.8,
                                                blurRadius: 4,
                                                offset: Offset(0, y_offset),
                                              )
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          children: [
                                            MaterialButton(
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                if (!first &&
                                                    ((result[result.length -
                                                                1] !=
                                                            '/') &&
                                                        result[result.length -
                                                                1] !=
                                                            '+' &&
                                                        result[result.length -
                                                                1] !=
                                                            '-' &&
                                                        result[result.length -
                                                                1] !=
                                                            'x')) {
                                                  k++;
                                                  result += '/';
                                                  counterBloc.counterSink
                                                      .add(result);
                                                }
                                              },
                                              // color: Colors.green,
                                              child: Text(
                                                '/',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(30, 30, 30, 1),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 2.5,
                                              offset: Offset(0, 2.3),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // color: Colors.blue,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(3.0, 0, 0, 6.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            MaterialButton(
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: () {
                                                if (!first) {
                                                  k++;
                                                  result += '0';
                                                  counterBloc.counterSink
                                                      .add(result);
                                                }
                                              },
                                              child: Text(
                                                '0',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              // color: Colors.green,
                                            ),
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(38, 38, 38, 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 0.8,
                                                blurRadius: 4,
                                                offset: Offset(0, y_offset),
                                              )
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '.',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(70, 70, 70, 1),
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(38, 38, 38, 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 0.8,
                                                blurRadius: 4,
                                                offset: Offset(0, y_offset),
                                              )
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            MaterialButton(
                                              onPressed: () {
                                                if (!first) {
                                                  previousresult = result;
                                                  previousBloc.previousSink
                                                      .add(previousresult);
                                                  result = "= 78";
                                                  counterBloc.counterSink
                                                      .add(result);
                                                }
                                              },
                                              child: Text(
                                                '=',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      70, 70, 70, 1),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              //color: Colors.green,
                                            ),
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(30, 30, 30, 1),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 2.5,
                                              offset: Offset(0, 2.3),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
