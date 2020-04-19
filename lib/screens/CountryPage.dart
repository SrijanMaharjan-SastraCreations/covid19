import 'dart:convert';
import 'package:covid19/Constants.dart';
import 'package:covid19/NumberFormatter.dart';
import 'package:covid19/UIHelper.dart';
import 'package:covid19/screens/IndividualCountry.dart';
import 'package:covid19/screens/Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryDataResponse;

  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryDataResponse = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Stats'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: Search(countryList: countryDataResponse));
              })
        ],
      ),
      body: countryDataResponse == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IndividualCountry(
                          individualCountryDetail: countryDataResponse[index],
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
                                  countryDataResponse[index]['country'],
                                  style: kCountryStatsCountryNameTextStyle,
                                ),
                                mediumVerticalGap,
                                Image.network(
                                  countryDataResponse[index]['countryInfo']
                                      ['flag'],
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
                                    'Confirmed: ${numberFormatter(countryDataResponse[index]['cases'].toString())}',
                                    style: kCountryStatsConfirmedTextStyle,
                                  ),
                                  Text(
                                    'Active: ${numberFormatter(countryDataResponse[index]['active'].toString())}',
                                    style: kCountryStatsActiveTextStyle,
                                  ),
                                  Text(
                                    'Recovered: ${numberFormatter(countryDataResponse[index]['recovered'].toString())}',
                                    style: kCountryStatsRecoveredTextStyle,
                                  ),
                                  Text(
                                    'Deaths: ${numberFormatter(countryDataResponse[index]['deaths'].toString())}',
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
              },
              itemCount:
                  countryDataResponse == null ? 0 : countryDataResponse.length,
            ),
    );
  }
}
