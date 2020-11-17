import 'package:flutter/material.dart';
import 'styles.dart';

class CalculatorScreen extends StatelessWidget {
  String res;
  Function backSpaceCb;
  CalculatorScreen({this.res, this.backSpaceCb});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SingleChildScrollView(
            child: Text(
              this.res,
              style: resultStyle,
              textAlign: TextAlign.right,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.money),
                color: Colors.white24,

                onPressed: () {
                  Navigator.pushNamed(context, "/convert");
                },
              ),
              IconButton(
                icon: Icon(Icons.backspace),
                color: Colors.white24,
                onPressed: () {
                  this.backSpaceCb();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
