import 'package:covid19/Constants.dart';
import 'package:covid19/components/DataSource.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              DataSource.questionAnswers[index]['question'],
              style: kFAQLabelTextStyle,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  DataSource.questionAnswers[index]['answer'],
                ),
              ),
            ],
          );
        },
        itemCount: DataSource.questionAnswers.length,
      ),
    );
  }
}
