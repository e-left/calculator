import 'package:flutter/material.dart';
import 'CustomButton.dart';

class CalculatorKeyboard extends StatelessWidget {
  Function cb;
  CalculatorKeyboard({this.cb});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "C",
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                      ),
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "( )",
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                      ),
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "%",
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                      ),
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "\u00F7",
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                      ),
                      cb: cb,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "7",
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "8",
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "9",
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "x",
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                      ),
                      cb: cb,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "4",
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "5",
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "6",
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "-",
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                      ),
                      cb: cb,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "1",
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "2",
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "3",
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "+",
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                      ),
                      cb: cb,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "+/-",
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "0",
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: ".",
                      cb: cb,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "=",
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                      cb: cb,
                      buttonColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
