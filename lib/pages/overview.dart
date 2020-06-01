import 'package:flutter/material.dart';
import 'package:len_afisha/models/events.dart';
import 'package:len_afisha/widgets/bottom_bar_overview_page.dart';
import 'package:len_afisha/widgets/i_am_busy_now.dart';
import 'package:len_afisha/widgets/oops_dialog.dart';
import 'package:len_afisha/widgets/overview_page_body.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatefulWidget {
  static const routName = 'overview-page';

  const OverviewPage({Key key}) : super(key: key);

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<EventsData>(context).fetchEventsData();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAppBarOverviewPage(),
      appBar: AppBar(
        title: const Text(
          'главное',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<EventsData>(
        builder: (context, eventsData, child) {
          if (eventsData.iAmBusyNow) {
            return const IAmBusyNowIndicator(); //если данные загружаются
          } else if (eventsData.oops) {
            return const OopsDialog(); // если что-то пошло не так
          } else {
            return OverviewPageBody(
                eventsData: eventsData); //если всё нормально
          }
        },
      ),
    );
  }
}
