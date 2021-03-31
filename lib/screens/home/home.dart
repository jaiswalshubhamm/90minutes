import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/providers/themeProvider.dart';
import 'package:provider/provider.dart';
import '../../config/palette.dart';
import '../../providers/fixturesDetailsProvider.dart';
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
    if (month.length < 2) {
      month = '0$month';
    }
    return '${date.year}-$month-${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "90 MINUTES",
            style: TextStyle(color: Palette.white),
          ),
          backgroundColor: Palette.primary,
          elevation: 20.0,
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
            // if (_tcontroller.index == 2)
            //   IconButton(
            //     icon: Icon(Icons.delete),
            //     onPressed: () {},
            //   ),
            // if (_tcontroller.index == 2)
            //   IconButton(
            //     icon: Icon(Icons.notification_important),
            //     onPressed: () {},
            //   ),
          ],
          bottom: TabBar(
            controller: _tcontroller,
            labelColor: Provider.of<ThemeProvider>(context).isDarkMode
                ? Palette.white
                : Palette.black,
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
            favorites(),
          ],
        ),
      ),
    );
  }
}
