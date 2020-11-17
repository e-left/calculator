import 'package:flutter/material.dart';
import 'styles.dart';
import 'constants.dart';

class CustomButton extends StatelessWidget {
  String text;
  TextStyle textStyle;
  Color buttonColor;
  double radius = buttonRadius;
  Function cb;

  CustomButton(
      {this.text,
      this.cb,
      this.textStyle = defaultButtonTextStyle,
      this.buttonColor = defaultButtonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: this.buttonColor,
      ),
      child: SizedBox.expand(
        child: FlatButton(
          onPressed: () => {this.cb(this.text)}, 
          child: Text(
            text,
            style: this.textStyle,
          ),
        ),
      ),
    );
  }
}
