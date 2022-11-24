import 'package:flutter/material.dart';
import 'package:layop/util/app_constant.dart';
import 'package:layop/widget/k_height.dart';
import 'package:layop/widget/k_text.dart';
import 'history_exam_details.dart';

class HistoryExamPage extends StatefulWidget {
  const HistoryExamPage({super.key});

  @override
  State<HistoryExamPage> createState() => _HistoryExamState();
}

class _HistoryExamState extends State<HistoryExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const KText(text: "Exams History"),
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
      result.add(ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HistoryExamDetails(
                        date: date,
                      ))) ;
        },
        leading: const Icon(Icons.calendar_month),
        title: KText(text: date),
        trailing: const Icon(Icons.arrow_forward_ios),
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
            builder: (context) => HistoryExamDetails(
                  date: date,
                )));
  }
}
