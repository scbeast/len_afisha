import 'package:flutter/material.dart';
import 'package:len_afisha/models/events.dart';
import 'package:provider/provider.dart';

class OopsDialog extends StatelessWidget {
  const OopsDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Вот незадача!'),
      content: const Text('Что-то пошло не так :('),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Provider.of<EventsData>(context, listen: false).fetchEventsData();
          },
          child: const Text(
            'Попробовать еще раз.',
          ),
        )
      ],
    );
  }
}
