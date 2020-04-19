import 'dart:convert';
import 'package:covid19/Constants.dart';
import 'package:covid19/UIHelper.dart';
import 'package:covid19/colors.dart';
import 'package:covid19/components/DataSource.dart';
import 'package:covid19/panels/InfoPanel.dart';
import 'package:covid19/panels/MostAffectedCountries.dart';
import 'package:covid19/panels/WorldWidePanel.dart';
import 'package:covid19/screens/CountryPage.dart';
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

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryData();
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
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                color: Colors.orange[100],
                child: Text(
                  DataSource.quote,
                  style: TextStyle(
                      color: Colors.orange[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Worldwide',
                      style: kLabelTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CountryPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: primaryBlack,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          'Regional',
                          style: kButtonTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              worldDataResponse == null
                  ? Center(child: CircularProgressIndicator())
                  : WorldWidePanel(
                      worldData: worldDataResponse,
                    ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Text(
                  'Most Affected Countries',
                  style: kLabelTextStyle,
                ),
              ),
              countryDataResponse == null
                  ? Center(child: CircularProgressIndicator())
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
