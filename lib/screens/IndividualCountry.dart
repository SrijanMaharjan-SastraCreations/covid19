import 'package:covid19/Constants.dart';
import 'package:covid19/NumberFormatter.dart';
import 'package:covid19/UIHelper.dart';
import 'package:covid19/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class IndividualCountry extends StatelessWidget {
  final Map individualCountryDetail;

  IndividualCountry({this.individualCountryDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${individualCountryDetail['country']}'s Statistics"),
      ),
      body: individualCountryDetail == null
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  smallVerticalGap,
                  Image.network(
                    individualCountryDetail['countryInfo']['flag'],
                    height: 124,
                    width: 132,
                  ),
                  Text(
                    individualCountryDetail['country'],
                    style: kCountryStatsCountryNameTextStyle,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Core Information',
                        style: kIndividualCountryLabelText,
                      ),
                    ),
                  ),
                  infoContainer(
                      title: 'Confirmed Cases',
                      cases: individualCountryDetail['cases'],
                      textColor: confirmedPanelTextColor,
                      color: confirmedPanelColor),
                  infoContainer(
                      title: 'Active Cases',
                      cases: individualCountryDetail['active'],
                      textColor: activePanelTextColor,
                      color: activePanelColor),
                  infoContainer(
                      title: 'Recovered',
                      cases: individualCountryDetail['recovered'],
                      textColor: recoveredPanelTextColor,
                      color: recoveredPanelColor),
                  infoContainer(
                      title: 'Deaths',
                      cases: individualCountryDetail['deaths'],
                      textColor: deathsPanelTextColor,
                      color: deathsPanelColor),
                  mediumVerticalGap,
                  divider,
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Pictorial Information',
                        style: kIndividualCountryLabelText,
                      ),
                    ),
                  ),
                  PieChart(
                    dataMap: {
                      'Confirmed': individualCountryDetail['cases'].toDouble(),
                      'Active': individualCountryDetail['active'].toDouble(),
                      'Recovered':
                          individualCountryDetail['recovered'].toDouble(),
                      'Deaths': individualCountryDetail['deaths'].toDouble(),
                    },
                    colorList: [
                      Colors.red,
                      Colors.blue[100],
                      Colors.green,
                      Colors.grey[400],
                    ],
                  ),
                  mediumVerticalGap,
                  divider,
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Other Information',
                        style: kIndividualCountryLabelText,
                      ),
                    ),
                  ),
                  textWithBottomLeftAlignment(
                      caseName: 'New Cases Today:',
                      caseNumber:
                          individualCountryDetail['todayCases'].toString()),
                  textWithBottomLeftAlignment(
                    caseName: 'Deaths Today:',
                    caseNumber:
                        individualCountryDetail['todayDeaths'].toString(),
                  ),
                  textWithBottomLeftAlignment(
                    caseName: 'Critical Cases:',
                    caseNumber: individualCountryDetail['critical'].toString(),
                  ),
                  textWithBottomLeftAlignment(
                    caseName: 'New Cases Today:',
                    caseNumber:
                        individualCountryDetail['todayCases'].toString(),
                  ),
                  textWithBottomLeftAlignment(
                    caseName: 'Cases Per One Million:',
                    caseNumber: individualCountryDetail['casesPerOneMillion']
                        .toString(),
                  ),
                  textWithBottomLeftAlignment(
                    caseName: 'Deaths Per One Million:',
                    caseNumber: individualCountryDetail['deathsPerOneMillion']
                        .toString(),
                  ),
                  textWithBottomLeftAlignment(
                    caseName: 'Tests:',
                    caseNumber: individualCountryDetail['tests'].toString(),
                  ),
                ],
              ),
            ),
    );
  }

  textWithBottomLeftAlignment({String caseName, String caseNumber}) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                numberFormatter(caseName),
                style: kIndividualCountryOtherStatTextStyle,
              ),
            ),
            Expanded(
              child: Text(
                numberFormatter(caseNumber),
                style: kIndividualCountryOtherStatTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  infoContainer({String title, int cases, Color color, Color textColor}) {
    return Center(
      child: Container(
        height: 124,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: textColor),
              ),
            ),
            Center(
              child: Text(
                numberFormatter(cases.toString()),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 56,
                    color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
