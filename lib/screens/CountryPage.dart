import 'dart:convert';
import 'package:covid19/Constants.dart';
import 'package:covid19/UIHelper.dart';
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
                                countryDataResponse[index]['country'],
                                style: kCountryStatsCountryNameTextStyle,
                              ),
                              largeVeritcalGap,
                              Image.network(
                                countryDataResponse[index]['countryInfo']
                                    ['flag'],
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
                                  'Confirmed: ${countryDataResponse[index]['cases'].toString()}',
                                  style: kCountryStatsConfirmedTextStyle,
                                ),
                                Text(
                                  'Active: ${countryDataResponse[index]['active'].toString()}',
                                  style: kCountryStatsActiveTextStyle,
                                ),
                                Text(
                                  'Recovered: ${countryDataResponse[index]['recovered'].toString()}',
                                  style: kCountryStatsRecoveredTextStyle,
                                ),
                                Text(
                                  'Deaths: ${countryDataResponse[index]['deaths'].toString()}',
                                  style: kCountryStatsDeathsTextStyle,
                                ),
                                smallVeritcalGap,
                                Text(
                                  'Other Stats',
                                  style: kCountryStatInfoTextStyle,
                                ),
                                smallVeritcalGap,
                                Text(
                                  'New Cases Today: ${countryDataResponse[index]['todayCases'].toString()}',
                                  style: kCountryStatsOtherStatsTextStyle,
                                ),
                                Text(
                                  'Deaths Today: ${countryDataResponse[index]['todayDeaths'].toString()}',
                                  style: kCountryStatsOtherStatsTextStyle,
                                ),
                                Text(
                                  'Critical: ${countryDataResponse[index]['critical'].toString()}',
                                  style: kCountryStatsOtherStatsTextStyle,
                                ),
                                Text(
                                  'New Cases Today: ${countryDataResponse[index]['todayCases'].toString()}',
                                  style: kCountryStatsOtherStatsTextStyle,
                                ),
                                Text(
                                  'Cases Per One Million: ${countryDataResponse[index]['casesPerOneMillion'].toString()}',
                                  style: kCountryStatsOtherStatsTextStyle,
                                ),
                                Text(
                                  'Deaths Per One Million: ${countryDataResponse[index]['deathsPerOneMillion'].toString()}',
                                  style: kCountryStatsOtherStatsTextStyle,
                                ),
                                Text(
                                  'Tests: ${countryDataResponse[index]['tests'].toString()}',
                                  style: kCountryStatsOtherStatsTextStyle,
                                ),
                                smallVeritcalGap,
                              ],
                            ),
                          ))
                    ],
                  ),
                );
              },
              itemCount:
                  countryDataResponse == null ? 0 : countryDataResponse.length,
            ),
    );
  }
}
