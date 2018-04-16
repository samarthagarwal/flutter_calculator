import 'package:flutter/material.dart';

void main() {
  runApp(new CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator",
      home: new CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  State createState() => new CalculatorState();
}

class CalculatorState extends State<CalculatorScreen> {
  //final TextEditingController _textController = new TextEditingController();

  String _output = "0";

  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  String output = "0";

  _buttonPressed(String text) {
    //clearing on C or CE
    if (text == "C" || text == "CE") {
      num1 = num2 = 0.0;
      output = "0";
      setState(() {
        _output = double.parse(output).toString();
        return;
      });
      return;
    }

    //clearing on <
    if (text == "<") {
      output = output.substring(0, output.length - 1);
      setState(() {
        _output = double.parse(output).toString();
        return;
      });
      return;
    }

    if (text == "+") {
      num1 = double.parse(output);
      operand = "+";
      output = "0";
      setState(() {
        _output = double.parse(output).toString();
        return;
      });
      return;
    } else if (text == "-") {
      num1 = double.parse(output);
      operand = "-";
      output = "0";
      setState(() {
        _output = double.parse(output).toString();
        return;
      });
      return;
    } else if (text == "/") {
      num1 = double.parse(output);
      operand = "/";
      output = "0";
      setState(() {
        _output = double.parse(output).toString();
        return;
      });
      return;
    } else if (text == "X") {
      num1 = double.parse(output);
      operand = "*";
      output = "0";
      setState(() {
        _output = double.parse(output).toString();
        return;
      });
      return;
    } else if (text == "%") {
      num1 = double.parse(output);
      operand = "%";
      output = "0";
      setState(() {
        _output = double.parse(output).toString();
        return;
      });
      return;
    }

    if (text == "=") {
      num2 = double.parse(output);
      switch (operand) {
        case "+":
          output = (num1 + num2).toString();
          break;
        case "-":
          output = (num1 - num2).toString();
          break;
        case "*":
          output = (num1 * num2).toString();
          break;
        case "/":
          output = (num1 / num2).toString();
          break;
        case "%":
          output = (num1 % num2).toString();
          break;
      }

      num1 = num2;
      num2 = double.parse(output);

      setState(() {
        _output = double.parse(output).toStringAsFixed(2);
        return;
      });
      return;
    }

    if (text == ".") {
      output = output + ".";
      setState(() {
        _output = double.parse(output).toString();
        return;
      });
      return;
    }

    output = output + text;

    setState(() {
      _output = double.parse(output).toString();
    });
  }

  Widget _calculatorButton(String text) {
    return new Expanded(
        child: new Material(
            color: Colors.white70,
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            child: new MaterialButton(
                padding: new EdgeInsets.all(25.0),
                elevation: 5.0,
                textColor: Colors.lightBlueAccent,
                child: new Text(
                  text,
                  textScaleFactor: 2.0,
                ),
                onPressed: () {
                  //print("Button pressed");
                  _buttonPressed(text);
                })));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      body: new Column(
        children: [
          new Container(
            padding: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            alignment: Alignment.centerRight,
            color: Colors.white12,
            child: new Text(
              _output,
              maxLines: 1,
              key: new Key("output"),
              textAlign: TextAlign.right,
              style: new TextStyle(
                  fontSize: 48.0,
                  fontFamily: 'Digital7',
                  color: Colors.lightBlue),
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Divider()
          ),
          new Row(children: <Widget>[
            _calculatorButton("C"),
            _calculatorButton("<"),
            _calculatorButton("/"),
            _calculatorButton("X")
          ]),
          new Row(children: <Widget>[
            _calculatorButton("7"),
            _calculatorButton("8"),
            _calculatorButton("9"),
            _calculatorButton("-")
          ]),
          new Row(children: <Widget>[
            _calculatorButton("4"),
            _calculatorButton("5"),
            _calculatorButton("6"),
            _calculatorButton("+")
          ]),
          new Row(children: <Widget>[
            _calculatorButton("1"),
            _calculatorButton("2"),
            _calculatorButton("3"),
            _calculatorButton("CE")
          ]),
          new Row(children: <Widget>[
            _calculatorButton("%"),
            _calculatorButton("0"),
            _calculatorButton("."),
            _calculatorButton("=")
          ])
        ],
      ),
    );
  }
}
