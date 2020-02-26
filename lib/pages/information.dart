import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  static const routName = 'information-page';
  const InformationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'информация',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
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
              Text(
                'Районный Дом Культуры',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '· Адрес:',
                          maxLines: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 6.0),
                        ),
                        Text(
                          '· Телефон:',
                          maxLines: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 6.0),
                        ),
                        Text(
                          '· e-mail:',
                          maxLines: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 6.0),
                        ),
                        Text(
                          '· Instagram',
                          maxLines: 1,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'с.Ленинское, ул. Ленина 22',
                          maxLines: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 6.0),
                        ),
                        Text(
                          '22-6-11 · 22-3-03',
                          maxLines: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 6.0),
                        ),
                        Text(
                          '@leninskoerdk',
                          maxLines: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 6.0),
                        ),
                        Text(
                          'rdk_len@post.eao.ru',
                          maxLines: 1,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
