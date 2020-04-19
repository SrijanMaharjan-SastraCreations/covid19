import 'package:covid19/NumberFormatter.dart';
import 'package:covid19/colors.dart';
import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldData;

  WorldWidePanel({Key key, this.worldData});
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
              worldData['cases'].toString(),
            ),
          ),
          StatusPanel(
            title: 'Active',
            panelColor: activePanelColor,
            textColor: activePanelTextColor,
            count: numberFormatter(
              worldData['active'].toString(),
            ),
          ),
          StatusPanel(
            title: 'Recovered',
            panelColor: recoveredPanelColor,
            textColor: recoveredPanelTextColor,
            count: numberFormatter(
              worldData['recovered'].toString(),
            ),
          ),
          StatusPanel(
            title: 'Deaths',
            panelColor: deathsPanelColor,
            textColor: deathsPanelTextColor,
            count: numberFormatter(
              worldData['deaths'].toString(),
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
