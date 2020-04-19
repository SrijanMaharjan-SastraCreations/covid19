import 'package:covid19/Constants.dart';
import 'package:covid19/NumberFormatter.dart';
import 'package:covid19/UIHelper.dart';
import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  MostAffectedPanel({this.countryData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            countryData[index]['countryInfo']['flag'],
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                  ),
                  mediumHorizontalGap,
                  Expanded(
                    flex: 8,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            countryData[index]['country'],
                            style: kMostAffectedCountriesCountryNameTextStyle,
                          ),
                          smallHorizontalGap,
                          Text(
                            'Deaths: ${numberFormatter(countryData[index]['deaths'].toString())}',
                            style: kMostAffectedCountriesDeathsTextStyle,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
