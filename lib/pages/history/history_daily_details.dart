import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:layop/util/app_constant.dart';
import 'package:layop/widget/k_height.dart';
import 'package:layop/widget/k_text.dart';
import 'package:layop/widget/k_width.dart';
import 'package:layop/widget/pie_chart_assesment.dart';
import 'package:layop/widget/pie_indicator.dart';


class HistoryDailyDetails extends StatefulWidget {
  final String? date;
  const HistoryDailyDetails({super.key, this.date});

  @override
  State<HistoryDailyDetails> createState() => _HistoryDailyDetailsState();
}

class _HistoryDailyDetailsState extends State<HistoryDailyDetails> {
  int _groupValue = -1;
  @override
  Widget build(BuildContext context) {
    // Assessment a = Assessment("1", "Maths", true, "montessori", "12/12/12",
    //     "edoo@gmail.com", ["helped to write"], ["Had to remind to focus"]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const KText(text: "Daily Assessment Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.horizontalPagePadding,
              vertical: AppConstant.verticalPagePadding),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const KText(
                text: "Daily History",
                size: AppConstant.titleText,
              ),
              const KHeight(height: AppConstant.largeSpace),
              KText(
                text: "Date: ${widget.date}",
                size: AppConstant.titleText,
              ),
              const KHeight(height: AppConstant.largeSpace),
              const KText(
                text: "Assessment",
                size: AppConstant.titleText,
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                children: [
                  const KText(
                    text: "Topic : ",
                    size: AppConstant.titleText,
                  ),
                  const k_width(
                    width: 20,
                  ),
                  KText(
                    text: 'a.topicName',
                    size: AppConstant.titleText,
                  ),
                ],
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                children: [
                  const KText(
                    text: "Methodology : ",
                    size: AppConstant.titleText,
                  ),
                  const k_width(
                    width: 20,
                  ),
                  KText(
                    text: 'a.methodology',
                    size: AppConstant.titleText,
                  ),
                ],
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                children: [
                  const KText(
                    text: "Assigned Date : ",
                    size: AppConstant.titleText,
                  ),
                  const k_width(
                    width: 20,
                  ),
                  KText(
                    text:' a.assignedDate',
                    size: AppConstant.titleText,
                  ),
                ],
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                children: [
                  const KText(
                    text: "Physical Prompts : ",
                    size: AppConstant.titleText,
                  ),
                  const k_width(
                    width: 20,
                  ),
                  KText(
                    text: 'a.physicalPrompts.toString()',
                    size: AppConstant.titleText,
                  ),
                ],
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                children: [
                  const KText(
                    text: "Verbal Prompts : ",
                    size: AppConstant.titleText,
                  ),
                  const k_width(
                    width: 20,
                  ),
                  KText(
                    text: 'a.verbalPrompts.toString()',
                    size: AppConstant.titleText,
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //       vertical: AppConstant.verticalPagePadding),
              //   child: Column(
              //     children: getQuestions(),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    height: 200,
                    child: PieChart(PieChartData(
                        centerSpaceRadius: 40, sections: getSection())),
                  ),
                  const PieIndicator()
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
