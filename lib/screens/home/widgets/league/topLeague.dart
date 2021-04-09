import 'package:flutter/material.dart';
import '../../../../providers/leagueProvider.dart';
import 'package:provider/provider.dart';

class TopLeague {
  String name;
  int id;
  TopLeague({this.name, this.id});
}

class TopLeagues extends StatelessWidget {
  final List<TopLeague> _topLeagues = [
    TopLeague(
      name: 'UEFA Champions League',
      id: 2,
    ),
    TopLeague(
      name: 'UEFA Europa League',
      id: 3,
    ),
    TopLeague(
      name: 'Premier League',
      id: 39,
    ),
    TopLeague(
      name: 'FA Cup',
      id: 45,
    ),
    TopLeague(
      name: 'Ligue 1',
      id: 61,
    ),
    TopLeague(
      name: 'Indian Super League',
      id: 323,
    ),
    TopLeague(
      name: 'Bundesliga 1',
      id: 78,
    ),
    TopLeague(
      name: 'Liga 3',
      id: 80,
    ),
    TopLeague(
      name: 'Primeira Liga',
      id: 94,
    ),
    TopLeague(
      name: 'Serie A',
      id: 135,
    ),
    TopLeague(
      name: 'La Liga',
      id: 140,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, i) {
        return Card(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  'https://media.api-sports.io/football/leagues/${_topLeagues[i].id}.png',
                  height: 28,
                  width: 28,
                ),
                SizedBox(width: 10),
                VerticalDivider(color: Colors.grey, thickness: 0.8),
              ],
            ),
            title: Text(_topLeagues[i].name),
            onTap: () {
              Provider.of<LeagueDetailsProvider>(context, listen: false)
                  .setId(_topLeagues[i].id);
              Navigator.pushNamed(
                context,
                '/leagues',
              );
            },
          ),
        );
      },
      itemCount: _topLeagues.length,
    );
  }
}
