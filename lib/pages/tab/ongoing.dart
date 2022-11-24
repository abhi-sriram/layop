import 'package:flutter/material.dart';
import 'package:layop/pages/exam_page.dart';
import 'package:layop/util/app_constant.dart';
import 'package:layop/widget/k_height.dart';
import 'package:layop/widget/k_text.dart';

class Ongoing extends StatefulWidget {
  const Ongoing({super.key});

  @override
  State<Ongoing> createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExamPage(),
                          ));
                    },
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: AppConstant.dangerColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(AppConstant
                                                    .borderRadiusWidget))),
                                        width: 40,
                                        height: 40,
                                        child: const Icon(
                                          Icons.hourglass_bottom,
                                          color: AppConstant.whiteTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      KText(
                                        text: "Unit Test ${index + 1}",
                                        size: AppConstant.titleText,
                                        weight: FontWeight.normal,
                                        color: AppConstant.tinyTextColor,
                                      ),
                                      const KText(
                                        text: "Unit name",
                                        size: AppConstant.leadingText,
                                        weight: FontWeight.bold,
                                        color: AppConstant.primaryColor,
                                      ),
                                      const KHeight(
                                          height: AppConstant.largeSpace),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: const [
                                          KText(
                                              text: "time left ",
                                              size: AppConstant.titleText),
                                          KText(
                                            text: " -12:14",
                                            color: AppConstant.dangerColor,
                                            weight: FontWeight.bold,
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              itemCount: 1),
        )
      ],
    );
  }
}
