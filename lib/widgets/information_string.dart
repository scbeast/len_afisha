import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationString extends StatelessWidget {
  const InformationString(
      {Key key,
      @required this.title,
      @required this.caption,
      @required this.launchArgument})
      : super(key: key);

  final String title;
  final String caption;
  final String launchArgument;

  Future<void> _launchAction() async {
    await launch(launchArgument);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          child: Text(
            caption,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          onTap: _launchAction,
        ),
      ],
    );
  }
}
