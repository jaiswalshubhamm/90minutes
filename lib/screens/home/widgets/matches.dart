import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/matches.dart';
import '../../../network/apiResponse.dart';
import '../../../providers/matchDetailsProvider.dart';

class Matches extends StatefulWidget {
  Matches({Key key}) : super(key: key);

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context) {
    var matchesData = Provider.of<MatchesDetailsProvider>(context);
    List<Response> _matches = matchesData.matches.data?.response;

    if (matchesData.matches.status != NetworkStatus.COMPLETED) {
      return Center(child: CircularProgressIndicator());
    } else if (matchesData.matches.status == NetworkStatus.COMPLETED) {
      return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  // leading: Image.network(
                  //   _matches[i].league.flag,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  title: Text(
                    _matches[i].league.name,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Text(
                            _matches[i].fixture.date.substring(11, 19),
                          ),
                          Text(
                            'Africa/Abidjan',
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                    ],
                  ),
                  title: Text('Title'),
                  trailing: Text('trail'),
                ),
              ],
            ),
          );
        },
        itemCount: _matches.length,
      );
    } else if (matchesData.matches.status == NetworkStatus.ERROR) {
      return Text("Error : ${matchesData.matches.message}");
    } else {
      return Text("${matchesData.matches.message}");
    }
  }
}
