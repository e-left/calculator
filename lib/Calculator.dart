import 'package:calculator/helpers.dart';
import 'package:flutter/material.dart';
import 'CalculatorScreen.dart';
import 'CalculatorKeyboard.dart';
import 'package:expressions/expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String res = "0";

  void backSpace() {
    if(this.res == "0") {
      return;
    }
    if(this.res.length == 1){
      this.setState(() {
        this.res = "0";
      });
      return;
    }
    this.setState(() {
      this.res = this.res.substring(0, this.res.length - 1);
    });
  }

  void handleInput(String k) {
    switch (k) {
      case "C":
        {
          this.setState(() {
            this.res = "0";
          });
        }
        break;
      case "( )":
        {
          // bug here
          String res = insertParen(this.res);
          this.setState(() {
            this.res = res;
          });
        }
        break;
      case "%":
        {
          if (!isSymbolLast(this.res) || isParenLast(this.res)) {
            this.setState(() {
              this.res = this.res + "%";
            });
          }
        }
        break;
      case "\u00F7":
        {
          if (!isSymbolLast(this.res) || isParenLast(this.res)) {
            this.setState(() {
              this.res = this.res + "\u00F7";
            });
          }
        }
        break;
      case "x":
        {
          if (!isSymbolLast(this.res) || isParenLast(this.res)) {
            this.setState(() {
              this.res = this.res + "x";
            });
          }
        }
        break;
      case "-":
        {
          if (!isSymbolLast(this.res) || isParenLast(this.res)) {
            this.setState(() {
              this.res = this.res + "-";
            });
          }
        }
        break;
      case "+":
        {
          if (!isSymbolLast(this.res) || isParenLast(this.res)) {
            this.setState(() {
              this.res = this.res + "+";
            });
          }
        }
        break;
      case "+/-":
        {
          String res = invertPol(this.res);
          this.setState(() {
            this.res = res;
          });
        }
        break;
      case ".":
        {
          if (!isSymbolLast(this.res) && canAddPeriod(this.res)) {
            this.setState(() {
              this.res = this.res + ".";
            });
          }
        }
        break;

      case "=":
        {
          this.res = finalizeExp(this.res);

          bool v = validExp(this.res);
          if (v) {
            Expression exp = Expression.parse(this.res);
            final evaluator = ExpressionEvaluator();
            var r = evaluator.eval(exp, null);

            this.setState(() {
              this.res = "${r}";
            });
          }
        }
        break;

      // for numbers
      default:
        {
          if (this.res == "0") {
            this.res = "";
          }
          this.setState(() {
            this.res = this.res + k;
          });
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 4,
                  child: CalculatorScreen(res: this.res, backSpaceCb: this.backSpace),
                ),
                Flexible(
                  flex: 5,
                  child: CalculatorKeyboard(
                    cb: (lb) => {handleInput(lb)},
                  ),
                )
              ],
            ),
          )),
    );
  }
}
