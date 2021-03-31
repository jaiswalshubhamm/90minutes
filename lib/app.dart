import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/palette.dart';
import 'package:flutter/services.dart';
import 'providers/playerProvider.dart';
import 'providers/themeProvider.dart';
import 'providers/authProvider.dart';
import 'providers/countriesDetailsProvider.dart';
import 'providers/leagueProvider.dart';
import 'providers/leagueDetailsProvider.dart';
import 'providers/fixturesDetailsProvider.dart';
import 'providers/fixtureProvider.dart';
import 'providers/oddProvider.dart';
import 'providers/teamProvider.dart';
import 'router.dart' as router;
import 'screens/home/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);

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
            ChangeNotifierProvider<TeamProvider>(
              create: (context) => TeamProvider(),
            ),
            ChangeNotifierProvider<PlayerProvider>(
              create: (context) => PlayerProvider(),
            ),
          ],
          child: MaterialApp(
            title: '90Minutes',
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            home: AnimatedSplashScreen(
              duration: 2500,
              splash: Image.asset("assets/images/dlogo.png"),
              splashIconSize: 140,
              nextScreen: Home(),
              splashTransition: SplashTransition.scaleTransition,
              backgroundColor: Palette.white,
            ),
            initialRoute: '/',
            onGenerateRoute: router.generateRoute,
          ),
        );
      });
}
