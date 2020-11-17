import 'package:calculator/styles.dart';
import 'package:flutter/material.dart';
import 'ConvertKeyboard.dart';
import 'ConvertScreen.dart';
import 'currency.dart';
import 'helpers.dart';

class Convert extends StatefulWidget {
  @override
  _ConvertState createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {
  String currentInput = "0";
  String converted = "0";
  Map<String, double> rates;
  bool canConvert = false;
  String from;
  String to;

  @override
  void initState() {
    super.initState();
    makeAPICall().then((value) {
      this.setState(() {
        this.rates = value;
      });
      this.canConvert = true;
      this.from = "EUR";
      this.to = "USD";
    }).catchError((error) {
      print(error);
      this.canConvert = false;
    });
  }

  void changeFrom(String from) {
    this.setState(() {
      this.from = from;
    });
  }

  void changeTo(String to) {
    this.setState(() {
      this.to = to;
    });
  }

  void swapCb() {
    String res =
        convert(this.rates, double.parse(this.converted), this.from, this.to)
            .toStringAsFixed(2);

    this.setState(() {
      this.currentInput = this.converted;
      this.converted = res;
    });
  }

  void handleInput(String ch) {
    if (this.canConvert) {
      switch (ch) {
        case "\$":
          {
            String res = convert(this.rates, double.parse(this.currentInput),
                    this.from, this.to)
                .toStringAsFixed(2);
            this.setState(() {
              this.converted = res;
            });
          }
          break;
        case ".":
          {
            if (!isSymbolLast(this.currentInput) &&
                canAddPeriod(this.currentInput)) {
              this.setState(() {
                this.currentInput = this.currentInput + ".";
              });
            }
          }
          break;
        default:
          {
            if (this.currentInput == "0") {
              this.setState(() {
                this.currentInput = ch;
              });
              break;
            }
            this.setState(() {
              this.currentInput = this.currentInput + ch;
            });
          }
          break;
      }
    }
  }

  void handleBackSpace() {
    this.setState(() {
      this.converted = "0";
    });
    if (this.currentInput == "0") {
      return;
    }
    if (this.currentInput.length == 1) {
      this.setState(() {
        this.currentInput = "0";
      });
      return;
    }
    this.setState(() {
      this.currentInput =
          this.currentInput.substring(0, this.currentInput.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget toBeReturned;

    if (this.canConvert) {
      toBeReturned = Flexible(
        flex: 4,
        child: ConvertScreen(
          res: this.currentInput,
          backSpaceCb: handleBackSpace,
          conv: this.converted,
          symbols: this.rates.keys.toList(),
          fromCb: this.changeFrom,
          toCb: this.changeTo,
          swapCb: this.swapCb,
        ),
      );
    } else {
      toBeReturned = Flexible(
        flex: 4,
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          margin: EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 10.0),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Can't convert. Please connect to the internet.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.calculate),
                    color: Colors.white24,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.backspace),
                    color: Colors.white24,
                    onPressed: () {
                      // this.widget.backSpaceCb();
                    },
                  ),
                ],
              ),
            ],
          ),
          // child: Text(
          //   "Can't convert. Please connect to the internet.",
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 30,
          //   ),
          // ),
        ),
      ); //TODO fix placeholder
    }

    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                toBeReturned,
                Flexible(
                  flex: 5,
                  child: ConvertKeyboard(cb: this.handleInput),
                )
              ],
            ),
          )),
    );
  }
}
