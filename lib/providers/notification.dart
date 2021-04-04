import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart' as t;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'fixtureProvider.dart';
import 'oddProvider.dart';

class NotificationProvider with ChangeNotifier {
  BuildContext _context;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future initialize(BuildContext context) async {
    _context = context;
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("ic_launcher");
    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: doSomething);
  }

  Future doSomething(String payload) async {
    print('hi');
    Provider.of<FixtureDetailsProvider>(_context, listen: false)
        .setId(int.parse(payload));
    Provider.of<OddProvider>(_context, listen: false).setId(int.parse(payload));
    Navigator.pushNamed(
      _context,
      '/fixture',
    );
  }

  Future zonedScheduledNotification(
      int fixtureID, String team1, String team2, String dateTime) async {
    String formatedDate = dateTime.substring(0, 10);
    String formatedTime = dateTime.substring(11, 19);
    String formatedMS = '000001';

    String formatedValue = '$formatedDate $formatedTime.$formatedMS';
    DateTime datetime = DateTime.parse(formatedValue);
    var scheduledNotificationDateTime = datetime;
    if (scheduledNotificationDateTime.isBefore(DateTime.now())) return;
    final timeZone = TimeZone();
    // The device's timezone.
    String timeZoneName = await timeZone.getTimeZoneName();
    // Find the 'current location'
    final location = await timeZone.getLocation(timeZoneName);
    final scheduledDate = t.TZDateTime.from(
      scheduledNotificationDateTime,
      location,
    );
    var android = AndroidNotificationDetails("id", "channel", "description");
    var ios = IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: ios);
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      fixtureID,
      'War between $team1 VS $team2',
      'Match is started, do not miss any updates.',
      scheduledDate,
      platform,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      payload: '$fixtureID',
    );
    // await _flutterLocalNotificationsPlugin
    //     .show(fixtureID, 'title', 'body', platform, payload: '$fixtureID');
  }

  Future cancelNotification(int fixtureId) async {
    await _flutterLocalNotificationsPlugin.cancel(fixtureId);
  }
}

class TimeZone {
  factory TimeZone() => _this ?? TimeZone._();

  TimeZone._() {
    initializeTimeZones();
  }
  static TimeZone _this;

  Future<String> getTimeZoneName() async =>
      FlutterNativeTimezone.getLocalTimezone();

  Future<t.Location> getLocation([String timeZoneName]) async {
    if (timeZoneName == null || timeZoneName.isEmpty) {
      timeZoneName = await getTimeZoneName();
    }
    return t.getLocation(timeZoneName);
  }
}
