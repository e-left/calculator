import 'package:flutter/material.dart';


class ConvertScreen extends StatefulWidget {
  String res;
  Function backSpaceCb;
  String conv;
  List<String> symbols;
  Function fromCb;
  Function toCb;
  Function swapCb;

  ConvertScreen({this.res, this.backSpaceCb, this.conv, this.symbols, this.fromCb, this.toCb, this.swapCb});

  @override
  _ConvertScreenState createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  String _fromValue;
  String _toValue;
  @override
  void initState() {
    super.initState();
    this.setState(() {
      _fromValue = "EUR";
      _toValue = "USD";
    });
  }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Row(
                  children: [
                    Text("From ", style: TextStyle(color: Colors.white, fontSize: 30,),),
                    DropdownButton(
                        value: _fromValue,
                        iconEnabledColor: Colors.white24,
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                        items: this
                            .widget
                            .symbols
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          this.widget.fromCb(value);
                          this.setState(() {
                            _fromValue = value;
                          });
                        }),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: SingleChildScrollView(
                  child: Text(
                    this.widget.res,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Flexible(
                flex: 2,
                child: Row(
                  children: [
                    Text("To ", style: TextStyle(color: Colors.white, fontSize: 30,),),
          
                    DropdownButton(
                        value: _toValue,
                        iconEnabledColor: Colors.white24,
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                        items: this
                            .widget
                            .symbols
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          this.widget.toCb(value);
                          this.setState(() {
                            _toValue = value;
                          });
                        }),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: SingleChildScrollView(
                  child: Text(
                    this.widget.conv,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
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
                icon: Icon(Icons.swap_vert_sharp),
                color: Colors.white24,
                onPressed: () {
                  this.widget.fromCb(this._toValue);
                  this.widget.toCb(this._fromValue);

                  this.setState(() {
                    String temp = this._fromValue;
                    this._fromValue = this._toValue;
                    this._toValue = temp;
                  });
                  this.widget.swapCb();
                },
              ),
              IconButton(
                icon: Icon(Icons.backspace),
                color: Colors.white24,
                onPressed: () {
                  this.widget.backSpaceCb();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
