import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:layop/util/app_constant.dart';

class MyTeacher extends StatefulWidget {
  const MyTeacher({super.key});

  @override
  State<MyTeacher> createState() => _MyTeacherState();
}

class _MyTeacherState extends State<MyTeacher> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("My Teacher"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: AppConstant.secondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text('Name'),
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: AppConstant.secondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text('Qualification'),
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: AppConstant.secondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text('Experience'),
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: AppConstant.secondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text('Description about themselves'),
            ),
          ),
          Card(
            child: Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: AppConstant.secondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text('Certificate')),
            ),
          )
        ],
      ),
    ));
  }
}
