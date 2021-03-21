import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'providers/authProvider.dart';
import 'providers/countriesDetailsProvider.dart';
import 'providers/leagueProvider.dart';
import 'providers/leagueDetailsProvider.dart';
import 'providers/fixturesDetailsProvider.dart';
import 'providers/fixtureProvider.dart';
import 'providers/oddProvider.dart';
import 'router.dart' as router;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
        ChangeNotifierProvider<LeagueDetailsProvider>(
          create: (context) => LeagueDetailsProvider(),
        ),
        ChangeNotifierProvider<FixturesDetailsProvider>(
          create: (context) => FixturesDetailsProvider(),
        ),
        ChangeNotifierProvider<FixtureDetailsProvider>(
          create: (context) => FixtureDetailsProvider(),
        ),
        ChangeNotifierProvider<OddProvider>(
          create: (context) => OddProvider(),
        ),
      ],
      child: MaterialApp(
        title: '90Minutes',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
