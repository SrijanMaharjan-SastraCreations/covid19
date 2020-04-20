import 'package:covid19/NumberFormatter.dart';
import 'package:covid19/colors.dart';
import 'package:flutter/material.dart';

class NepalPanel extends StatelessWidget {
  final Map nepalData;

  NepalPanel({Key key, this.nepalData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          StatusPanel(
            title: 'Confirmed',
            panelColor: confirmedPanelColor,
            textColor: confirmedPanelTextColor,
            count: numberFormatter(
              nepalData['cases'].toString(),
            ),
          ),
          StatusPanel(
            title: 'Active',
            panelColor: activePanelColor,
            textColor: activePanelTextColor,
            count: numberFormatter(
              nepalData['active'].toString(),
            ),
          ),
          StatusPanel(
            title: 'Recovered',
            panelColor: recoveredPanelColor,
            textColor: recoveredPanelTextColor,
            count: numberFormatter(
              nepalData['recovered'].toString(),
            ),
          ),
          StatusPanel(
            title: 'Deaths',
            panelColor: deathsPanelColor,
            textColor: deathsPanelTextColor,
            count: numberFormatter(
              nepalData['deaths'].toString(),
            ),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final String title;
  final Color panelColor;
  final Color textColor;
  final String count;

  StatusPanel({this.title, this.panelColor, this.textColor, this.count});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(8),
      height: 80,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          )
        ],
      ),
    );
  }
}
