import 'package:flutter/material.dart';

class LeagueScreen extends StatefulWidget {
  final int id;
  const LeagueScreen({Key key, this.id}) : super(key: key);
  @override
  _LeagueScreenState createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('League ${widget.id}');
  }
}
