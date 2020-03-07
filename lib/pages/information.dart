import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationPage extends StatelessWidget {
  static const routName = 'information-page';
  const InformationPage({Key key}) : super(key: key);

  _launchInstagram() async {
    const String _url = 'https://www.instagram.com/leninskoerdk/';
    await launch(_url);
  }

  _launchBrowser() async {
    const String _url = 'http://www.leninskoerdk.ru/';
    await launch(_url);
  }

  _mailToEmail() async {
    const String _url = 'mailto:rdk_len@post.eao.ru';
    await launch(_url);
  }

  _phoneCallFirst() async {
    const String _url = 'tel:+7 426 632 26 11';
    await launch(_url);
  }

  _phoneCallSecond() async {
    const String _url = 'tel:+7 426 632 23 03';
    await launch(_url);
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '· Адрес: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'с. Ленинское, ул. Ленина 22',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 6.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '· Телефон: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    child: const Text(
                      '22-6-11',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    onTap: _phoneCallFirst,
                  ),
                  const Text(
                    ' · ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    child: const Text(
                      '22-3-03',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: _phoneCallSecond,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 6.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '· e-mail: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                      child: const Text(
                        'rdk_len@post.eao.ru',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      onTap: _mailToEmail),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 6.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '· Instagram: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    child: const Text(
                      '@leninskoerdk',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    onTap: _launchInstagram,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 6.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '· www: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    child: const Text(
                      'http://www.leninskoerdk.ru/',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    onTap: _launchBrowser,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
