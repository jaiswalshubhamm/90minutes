import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/palette.dart';
import '../../providers/fixturesDetailsProvider.dart';
import '../../providers/authProvider.dart';
import '../../providers/notification.dart';
import '../../widgets/drawer.dart';
import 'widgets/leagues.dart';
import 'widgets/fixtures.dart';
import 'widgets/favorites.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool isSwitched = false;
  DateTime date = DateTime.now();
  TabController _tcontroller;

  @override
  void initState() {
    _tcontroller = TabController(length: 3, vsync: this, initialIndex: 1);
    _tcontroller.addListener(() {
      setState(() {});
    });
    Provider.of<AuthProvider>(context, listen: false).checkIfLoggedIn();
    Provider.of<NotificationProvider>(context, listen: false)
        .initialize(context);
    super.initState();
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: Palette.primary),
          ),
          child: child,
        );
      },
    );
    if (newDate == null) return;
    String dateParam = getText(newDate);
    setState(() {
      isSwitched = false;
    });
    Provider.of<FixturesDetailsProvider>(context, listen: false)
        .setDate(dateParam);
  }

  String getText(DateTime date) {
    String month = '${date.month}';
    String day = '${date.day}';
    if (month.length < 2) {
      month = '0$month';
    }
    if (day.length < 2) {
      day = '0$day';
    }
    return '${date.year}-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "90 MINUTES",
          ),
          actions: [
            if (_tcontroller.index == 1)
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    Provider.of<FixturesDetailsProvider>(context, listen: false)
                        .setLive(isSwitched);
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Palette.primary,
              ),
            if (_tcontroller.index == 1)
              IconButton(
                icon: Icon(Icons.today),
                onPressed: () => pickDate(context),
              ),
          ],
          bottom: TabBar(
            controller: _tcontroller,
            indicatorWeight: 4.0,
            indicatorColor: Palette.white,
            tabs: [
              Tab(text: "LEAUGES"),
              Tab(text: "MATCHES"),
              Tab(text: "FAVORITES"),
            ],
          ),
        ),
        drawer: Drawer(
          child: MenuDrawer(),
        ),
        body: TabBarView(
          controller: _tcontroller,
          children: [
            Leagues(),
            Fixtures(),
            Favorites(),
          ],
        ),
      ),
    );
  }
}
