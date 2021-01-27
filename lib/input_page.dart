import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI '),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                new ReusableCard(),
                ReusableCard(),
              ],
            ),
          ),
          ReusableCard(),
          Expanded(
            child: Row(
              children: <Widget>[
                ReusableCard(),
                ReusableCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: Color(0xFF1D1F33),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
