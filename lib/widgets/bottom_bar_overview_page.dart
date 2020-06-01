import 'package:flutter/material.dart';
import 'package:len_afisha/pages/home.dart';

class BottomAppBarOverviewPage extends StatelessWidget {
  const BottomAppBarOverviewPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            side:
                const BorderSide(style: BorderStyle.solid, color: Colors.blue),
            borderRadius: BorderRadius.circular(20.0),
          ),
          splashColor: Colors.blue,
          child: const Text(
            'далее',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomePage.routName);
          },
        ),
      ),
    );
  }
}
