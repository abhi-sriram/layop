import 'package:flutter/material.dart';
import 'package:layop/util/app_constant.dart';
import 'package:layop/widget/hamburger.dart';
import 'package:layop/widget/k_height.dart';
import 'package:layop/widget/k_text.dart';
import '../../../widget/k_button.dart';
import 'history_daily_details.dart';
import 'history_page.dart';

class HistoryDailyPage extends StatefulWidget {
  const HistoryDailyPage({super.key});

  @override
  State<HistoryDailyPage> createState() => _HistoryDailyState();
}

class _HistoryDailyState extends State<HistoryDailyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const KText(text: "Daily Activities History"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstant.horizontalPagePadding,
            vertical: AppConstant.verticalPagePadding),
        child: SingleChildScrollView(
          child: Column(children: dates()),
        ),
      )),
    );
  }

  List<Widget> dates() {
    List<String> dates = [
      "18/11/2022",
      "19/11/2022",
      "20/11/2022",
      "21/11/2022",
      "22/11/2022"
    ];
    List<Widget> result = <Widget>[];
    for (var date in dates) {
      result.add(ElevatedButton(
        onPressed: () {
          navigateToDetails(date);
        },
        child: Text(date),
      ));
      result.add(const KHeight(height: AppConstant.largeSpace));
    }
    return result;
  }

  void navigateToDetails(String date) {
    print(date);
    print("object");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HistoryDailyDetails(
                  date: date,
                )));
  }
}
