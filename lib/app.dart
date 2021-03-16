import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'providers/authProvider.dart';
import 'providers/countriesDetailsProvider.dart';
import 'providers/matchDetailsProvider.dart';
import 'package:provider/provider.dart';
import 'providers/leagueDetailsProvider.dart';
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
        ChangeNotifierProvider<MatchesDetailsProvider>(
          create: (context) => MatchesDetailsProvider(),
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
