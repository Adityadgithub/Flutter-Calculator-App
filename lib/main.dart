import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var numbers = "";
  var digitpressed = "";
  var perform = "";

  double result = 0;
  double a = 0;
  double b = 0;

  var inta;
  var intb;

  bool? backspacepressed;
  bool? resultpressed;
  bool? decimalpressed;
  bool? operator = false;
  bool? end = false;

  bool? checkvalueA = false;

  void buttonpressed(value) {
    print(value);
    setState(() {});
    digitpressed += "$value";
    operator == false
        ? a = double.parse(digitpressed)
        : b = double.parse(digitpressed);
    numbers += "$value";
    resultpressed = false;
    checkvalueA = true;
  }

  void operatorpressed(value) {
    setState(() {});
    if ((operator == false && checkvalueA == true)) {
      operator = true;
      perform = "$value";
      numbers += "$value";
      digitpressed = "";
      resultpressed = false;
    }
  }

  void clearbutton() {
    setState(() {});
    numbers = "";
    result = 0;
    digitpressed = "";
    operator = false;
    resultpressed = false;
    checkvalueA = false;
  }

  void backspace() {
    setState(() {});
    if (numbers.endsWith("/") |
        numbers.endsWith("*") |
        numbers.endsWith("-") |
        numbers.endsWith("+")) {
      perform = "";
      operator = false;
    }

    if (resultpressed == false) {
      numbers = numbers.substring(0, numbers.length - 1);
      digitpressed = digitpressed.substring(0, digitpressed.length - 1);

      backspacepressed = true;

      if (operator == false) {
        print("\n\nBAck A: $a");
        a = a / 10;
        inta = a.toInt();
        a = inta;
        print("\nAFter A: $a");
        backspacepressed = false;
      } else if (operator == true) {
        b = b / 10;
        intb = b.toInt();
        b = intb;
        backspacepressed = false;
      }
      ;

      print("\n\n BACKSPACE PRESSED\n\n");
      print("A: $a");
      print("B: $b");
    }
  }

  void resultbutton() {
    setState(() {});
    // operator = "=";
    if (checkvalueA == true && operator == true) {
      if (perform == "+") {
        result = a + b;
      } else if (perform == "-") {
        result = a - b;
      } else if (perform == "*") {
        result = a * b;
      } else if (perform == "/") {
        result = (a / b);
      }

      operator = false;
      resultpressed = true;

      print(result);

      print("B: $b");

      print("A: $a");

      print("\nAfter clearance");

      a = result;
      b = 0;

      print("B: $b");

      print("A: $a");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Simple Calculator"),
        ),
        body: Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  height: 200,
                  color: Colors.black,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "$numbers",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    maxLines: 4,
                    softWrap: true,
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 160,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("   TOTAL:",
                          style: TextStyle(
                              fontSize: 15,
                              decorationThickness: 5,
                              color: Color.fromARGB(255, 202, 200, 200))),
                      Text(
                        "$result ",
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w900,
                            fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //BUTTONS
            Row(
              children: [
                CalcButton(
                    value: "C",
                    color: Colors.red,
                    onpressed: () {
                      clearbutton();
                    }),
                CalcButton(
                    value: "Backspace",
                    color: Colors.blue,
                    onpressed: () {
                      backspace();
                    }),
                CalcButton(
                    value: "/",
                    color: Colors.blue,
                    onpressed: () {
                      operatorpressed("/");
                    }),
                CalcButton(
                    value: "*",
                    color: Colors.blue,
                    onpressed: () {
                      operatorpressed("*");
                    }),
              ],
            ),

            Row(
              children: [
                CalcButton(
                    value: "7",
                    color: Colors.grey,
                    onpressed: () {
                      buttonpressed("7");
                    }),
                CalcButton(
                    value: "8",
                    color: Colors.grey,
                    onpressed: () {
                      buttonpressed("8");
                    }),
                CalcButton(
                    value: "9",
                    color: Colors.grey,
                    onpressed: () {
                      buttonpressed("9");
                    }),
                Center(
                  child: CalcButton(
                      value: "-",
                      color: Colors.blue,
                      onpressed: () {
                        operatorpressed("-");
                      }),
                ),
              ],
            ),
            Row(
              children: [
                CalcButton(
                    value: "4",
                    color: Colors.grey,
                    onpressed: () {
                      buttonpressed("4");
                    }),
                CalcButton(
                    value: "5",
                    color: Colors.grey,
                    onpressed: () {
                      buttonpressed("5");
                    }),
                CalcButton(
                    value: "6",
                    color: Colors.grey,
                    onpressed: () {
                      buttonpressed("6");
                    }),
                CalcButton(
                    value: "+",
                    color: Colors.blue,
                    onpressed: () {
                      operatorpressed("+");
                    }),
              ],
            ),
            Row(
              children: [
                CalcButton(
                    value: "1",
                    color: Colors.grey,
                    onpressed: () {
                      buttonpressed(1);
                    }),
                CalcButton(
                    value: "2",
                    color: Colors.grey,
                    onpressed: () {
                      buttonpressed("2");
                    }),
                CalcButton(
                    value: "3",
                    color: Colors.grey,
                    onpressed: () {
                      buttonpressed("3");
                    }),
                CalcButton(
                    value: "=",
                    color: Colors.blue,
                    onpressed: () {
                      resultbutton();
                    }),
              ],
            ),
            Row(
              children: [
                CalcButton(
                  value: ".",
                  color: Colors.grey,
                  onpressed: () {
                    setState(() {});
                    numbers += ".";
                    digitpressed += ".";
                  },
                ),
                CalcButton(
                    value: "0",
                    color: Colors.grey,
                    onpressed: () {
                      buttonpressed("0");
                    }),
                CalcButton(
                    value: "00",
                    color: Colors.grey,
                    onpressed: () {
                      buttonpressed("00");
                    }),
              ],
            )
          ],
        ),
        //BUTTONS
      ),
    );
  }
}

class CalcButton extends StatelessWidget {
  var value;
  var color;
  Function onpressed;

  CalcButton(
      {Key? key, @required this.value, this.color, required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1191,
      width: MediaQuery.of(context).size.width * 0.25,
      child: TextButton(
          style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: color,
              // minimumSize: Size(133, 84),
              elevation: 0,
              side: BorderSide(width: 0)),
          onPressed: () {
            onpressed();
          },
          child: Text(
            "$value",
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
          )),
    );
  }
}
