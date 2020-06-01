import 'package:flutter/material.dart';
import 'package:len_afisha/widgets/information_string.dart';

class InformationPage extends StatelessWidget {
  static const routName = 'information-page';
  const InformationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'информация',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 10.0,
                child: SizedBox(
                    height: 200,
                    child: Image.asset('assets/images/rdk-logo.jpg')),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 8.0)),
              const Text(
                'Районный Дом Культуры',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 8.0)),
              const InformationString(
                  title: '· Адрес: ',
                  caption: 'с. Ленинское, ул. Ленина 22',
                  launchArgument:
                      'https://www.openstreetmap.org/way/478626266#map=18/47.93323/132.62089'),
              const Padding(padding: EdgeInsets.only(bottom: 6.0)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const InformationString(
                    title: '· Телефон: ',
                    caption: '(42663) 22-6-11',
                    launchArgument: 'tel:+7 426 632 26 11'),
                const InformationString(
                    title: ' · ',
                    caption: '(42663) 22-3-03',
                    launchArgument: 'tel:+7 426 632 23 03'),
              ]),
              const Padding(padding: EdgeInsets.only(bottom: 6.0)),
              const InformationString(
                  title: '· e-mail: ',
                  caption: 'rdk_len@post.eao.ru',
                  launchArgument: 'mailto:rdk_len@post.eao.ru'),
              const Padding(padding: EdgeInsets.only(bottom: 6.0)),
              const InformationString(
                  title: '· Instagram: ',
                  caption: '@leninskoerdk',
                  launchArgument: 'https://www.instagram.com/leninskoerdk/'),
              const Padding(padding: EdgeInsets.only(bottom: 6.0)),
              const InformationString(
                  title: '· www: ',
                  caption: 'http://www.leninskoerdk.ru/',
                  launchArgument: 'http://www.leninskoerdk.ru/'),
              const Padding(padding: EdgeInsets.only(bottom: 6.0)),
              const InformationString(
                  title: '· разработка: ',
                  caption: 'scbeast',
                  launchArgument: 'mailto:scbeast555655@gmail.com'),
            ],
          ),
        ),
      ),
    );
  }
}
