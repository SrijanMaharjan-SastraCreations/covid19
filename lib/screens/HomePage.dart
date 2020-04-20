import 'dart:convert';
import 'package:covid19/Constants.dart';
import 'package:covid19/UIHelper.dart';
import 'package:covid19/components/DataSource.dart';
import 'package:covid19/panels/InfoPanel.dart';
import 'package:covid19/panels/MostAffectedCountries.dart';
import 'package:covid19/panels/NepalPanel.dart';
import 'package:covid19/panels/WorldWidePanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldDataResponse;

  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldDataResponse = jsonDecode(response.body);
    });
  }

  List countryDataResponse;

  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryDataResponse = jsonDecode(response.body);
    });
  }

  Map nepalDataResponse;

  fetchNepalData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries/nepal');
    setState(() {
      nepalDataResponse = jsonDecode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryData();
    fetchNepalData();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Tracker'),
      ),
      body: nepalDataResponse == null
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : RefreshIndicator(
              onRefresh: fetchData,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Worldwide',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                    ),
                    worldDataResponse == null
                        ? Center(child: CupertinoActivityIndicator())
                        : WorldWidePanel(
                            worldData: worldDataResponse,
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Nepal',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                    ),
                    countryDataResponse == null
                        ? Center(child: CupertinoActivityIndicator())
                        : NepalPanel(
                            nepalData: nepalDataResponse,
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8.0),
                      child: Text(
                        'Most Affected Countries',
                        style: kLabelTextStyle,
                      ),
                    ),
                    countryDataResponse == null
                        ? Center(child: CupertinoActivityIndicator())
                        : MostAffectedPanel(
                            countryData: countryDataResponse,
                          ),
                    mediumVerticalGap,
                    InfoPanel(),
                  ],
                ),
              ),
            ),
    );
  }
}
