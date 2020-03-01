import 'package:flutter/material.dart';

class EmptyEventsListWidget extends StatelessWidget {
  const EmptyEventsListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height / 3;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Card(
          elevation: 10.0,
          child: Image.asset(
            'assets/images/rdk-logo.jpg',
            height: _height,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
        ),
        Text(
          'Пока ничего нет.',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26.0, color: Colors.blue),
        ),
      ],
    );
  }
}
