import 'package:flutter/material.dart';
import 'screens/feedback.dart';
import 'screens/home/home.dart';
import 'screens/league/league.dart';
import 'screens/logIn/login.dart';
import 'screens/fixture/fixture.dart';
import 'screens/signUp/register.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => Home());
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case '/register':
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    case '/leagues':
      return MaterialPageRoute(builder: (_) => LeagueScreen(id: args));
    case '/fixture':
      return MaterialPageRoute(builder: (_) => FixtureScreen(id: args));
    case '/feed':
      return MaterialPageRoute(builder: (_) => FeedbackScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}
