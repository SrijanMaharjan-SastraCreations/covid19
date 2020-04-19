import 'package:covid19/Constants.dart';
import 'package:covid19/UIHelper.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryList;

  Search({this.countryList});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[100],
                  blurRadius: 8,
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          suggestionList[index]['country'],
                          style: kCountryStatsCountryNameTextStyle,
                        ),
                        largeVeritcalGap,
                        Image.network(
                          suggestionList[index]['countryInfo']['flag'],
                        )
                      ],
                    ),
                  ),
                ),
                largeHorizontalGap,
                Expanded(
                    flex: 8,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Core Stats',
                            style: kCountryStatInfoTextStyle,
                          ),
                          smallVeritcalGap,
                          Text(
                            'Confirmed: ${suggestionList[index]['cases'].toString()}',
                            style: kCountryStatsConfirmedTextStyle,
                          ),
                          Text(
                            'Active: ${suggestionList[index]['active'].toString()}',
                            style: kCountryStatsActiveTextStyle,
                          ),
                          Text(
                            'Recovered: ${suggestionList[index]['recovered'].toString()}',
                            style: kCountryStatsRecoveredTextStyle,
                          ),
                          Text(
                            'Deaths: ${suggestionList[index]['deaths'].toString()}',
                            style: kCountryStatsDeathsTextStyle,
                          ),
                          smallVeritcalGap,
                          Text(
                            'Other Stats',
                            style: kCountryStatInfoTextStyle,
                          ),
                          smallVeritcalGap,
                          Text(
                            'New Cases Today: ${suggestionList[index]['todayCases'].toString()}',
                            style: kCountryStatsOtherStatsTextStyle,
                          ),
                          Text(
                            'Deaths Today: ${suggestionList[index]['todayDeaths'].toString()}',
                            style: kCountryStatsOtherStatsTextStyle,
                          ),
                          Text(
                            'Critical: ${suggestionList[index]['critical'].toString()}',
                            style: kCountryStatsOtherStatsTextStyle,
                          ),
                          Text(
                            'New Cases Today: ${suggestionList[index]['todayCases'].toString()}',
                            style: kCountryStatsOtherStatsTextStyle,
                          ),
                          Text(
                            'Cases Per One Million: ${suggestionList[index]['casesPerOneMillion'].toString()}',
                            style: kCountryStatsOtherStatsTextStyle,
                          ),
                          Text(
                            'Deaths Per One Million: ${suggestionList[index]['deathsPerOneMillion'].toString()}',
                            style: kCountryStatsOtherStatsTextStyle,
                          ),
                          Text(
                            'Tests: ${suggestionList[index]['tests'].toString()}',
                            style: kCountryStatsOtherStatsTextStyle,
                          ),
                          smallVeritcalGap,
                        ],
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
