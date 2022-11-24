import 'package:flutter/material.dart';
import 'package:layop/pages/tab/ongoing.dart';
import 'package:layop/pages/tab/upcoming.dart';
import 'package:layop/util/app_constant.dart';

import 'package:layop/widget/k_text.dart';

class Exams extends StatefulWidget {
  const Exams({super.key});

  @override
  State<Exams> createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const KText(text: "Exams"),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: const [
              TabBar(tabs: [
                Tab(
                  child: KText(
                      size: AppConstant.normalText,
                      text: "ongoing",
                      color: AppConstant.primaryColor),
                ),
                Tab(
                  child: KText(
                      size: AppConstant.normalText,
                      text: "upcoming",
                      color: AppConstant.primaryColor),
                ),
              ]),
              Expanded(
                  child: TabBarView(children: <Widget>[
                Ongoing(),
                Upcoming(),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
