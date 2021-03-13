import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nintyminutesflutter/models/countries.dart';
import 'package:nintyminutesflutter/network/apiResponse.dart';
import 'package:nintyminutesflutter/providers/countriesDetailsProvider.dart';
import 'package:provider/provider.dart';

class Leagues extends StatefulWidget {
  Leagues({Key key}) : super(key: key);

  @override
  _LeaguesState createState() => _LeaguesState();
}

class _LeaguesState extends State<Leagues> {
  @override
  Widget build(BuildContext context) {
    var countriesData = Provider.of<CountriesDetailsProvider>(context);
    List<Response> _countries = countriesData.countries.data?.response;

    if (countriesData.countries.status != Status.COMPLETED) {
      return Center(child: CircularProgressIndicator());
    } else if (countriesData.countries.status == Status.COMPLETED) {
      return ListView(
        children: [
          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _countries[index].isExpanded = !isExpanded;
              });
            },
            children: _countries.map<ExpansionPanel>((Response item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25.0)),
                          child: SvgPicture.network(
                            item.flag ??
                                'https:\/\/media.api-sports.io\/flags\/aw.svg',
                            height: 15, width: 15,
                            // allowDrawingOutsideViewBox: true,
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    // padding: const EdgeInsets.all(3.0),
                                    child: const CircularProgressIndicator()),
                          ),
                        ),
                      ),
                      Text(item.name),
                    ],
                  );
                },
                body: ListTile(
                  title: Text('hi'),
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          ),
        ],
      );
    } else if (countriesData.countries.status == Status.ERROR) {
      return Text("Error : ${countriesData.countries.message}");
    } else {
      return Text("${countriesData.countries.message}");
    }
  }
}
