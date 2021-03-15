import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/providers/authProvider.dart';
import 'package:nintyminutesflutter/providers/countriesDetailsProvider.dart';
import 'package:nintyminutesflutter/providers/matchDetailsProvider.dart';
import 'package:provider/provider.dart';

import 'providers/leagueDetailsProvider.dart';
import 'screens/home/home.dart';
import 'screens/logIn/login.dart';
import 'screens/signUp/register.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<CountriesDetailsProvider>(
          create: (context) => CountriesDetailsProvider(),
        ),
        ChangeNotifierProvider<LeaguesDetailsProvider>(
          create: (context) => LeaguesDetailsProvider(),
        ),
        ChangeNotifierProvider<MatchesDetailsProvider>(
          create: (context) => MatchesDetailsProvider(),
        ),
      ],
      child: MaterialApp(
        title: '90Minutes',
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => Home(),
          // "/feedback": (context) => FeedbackScreen(),
          "/login": (context) => LoginScreen(),
          "/register": (context) => RegisterScreen(),
        },
      ),
    );
  }
}
