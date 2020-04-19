import 'package:covid19/Constants.dart';
import 'package:covid19/NumberFormatter.dart';
import 'package:covid19/UIHelper.dart';
import 'package:covid19/screens/IndividualCountry.dart';
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
    return searchResult();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return searchResult();
  }

  searchResult() {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndividualCountry(
                    individualCountryDetail: suggestionList[index],
                  ),
                ),
              );
            },
            child: Container(
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
                    flex: 6,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            suggestionList[index]['country'],
                            style: kCountryStatsCountryNameTextStyle,
                          ),
                          mediumVerticalGap,
                          Image.network(
                            suggestionList[index]['countryInfo']['flag'],
                          ),
                          smallVerticalGap
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
                            smallVerticalGap,
                            Text(
                              'Confirmed: ${numberFormatter(suggestionList[index]['cases'].toString())}',
                              style: kCountryStatsConfirmedTextStyle,
                            ),
                            Text(
                              'Active: ${numberFormatter(suggestionList[index]['active'].toString())}',
                              style: kCountryStatsActiveTextStyle,
                            ),
                            Text(
                              'Recovered: ${numberFormatter(suggestionList[index]['recovered'].toString())}',
                              style: kCountryStatsRecoveredTextStyle,
                            ),
                            Text(
                              'Deaths: ${numberFormatter(suggestionList[index]['deaths'].toString())}',
                              style: kCountryStatsDeathsTextStyle,
                            ),
                            smallVerticalGap,
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
