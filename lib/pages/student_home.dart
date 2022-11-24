import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:layop/pages/exams.dart';
import 'package:layop/pages/history/history_page.dart';
import 'package:layop/pages/message.dart';
import 'package:layop/pages/my_teacher.dart';
import 'package:layop/pages/ocr/ocr_page.dart';
import 'package:layop/pages/profile.dart';
import 'package:layop/pages/progress_page.dart';
import 'package:layop/pages/scribble/scribble_pad.dart';
import 'package:layop/pages/syllabus_page.dart';
import 'package:layop/service/auth_service.dart';
import 'package:layop/util/app_constant.dart';

import 'package:layop/widget/k_height.dart';
import 'package:layop/widget/k_text.dart';

class ParentHome extends StatefulWidget {
  const ParentHome({super.key});

  @override
  State<ParentHome> createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {
  _ParentHomeState() {
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton(
        "3604cbfc4d26a19c4036ffbe5b77e1d72e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT);

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) => _openProfilPage(command.data));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _openProfilPage(Map<String, dynamic> command) {
    switch (command['command']) {
      case 'profile':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profil(),
            ));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const KText(text: "LAYOP", weight: FontWeight.w700),
        actions: <Widget>[
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessageOfStudent(),
                  )),
              icon: const Icon(
                Icons.notifications,
                color: AppConstant.whiteTextColor,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profil(),
                  )),
              child: const CircleAvatar(
                backgroundColor: AppConstant.whiteTextColor,
                child: Icon(Icons.person),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KHeight(height: AppConstant.largeSpace),
                  KText(
                      text: "Habib folly Messan",
                      size: AppConstant.leadingText,
                      weight: FontWeight.w500),
                  KHeight(height: AppConstant.largeSpace),

                  KText(
                    text: "Welcome and learn at your own pace",
                    size: AppConstant.leadingText,
                  ),
                  KHeight(height: AppConstant.largeSpace),

                  Divider(
                    thickness: 1,
                    endIndent: 100,
                  ),
                  KText(
                      color: AppConstant.bodyTextColor,
                      text: "what do you want to do today ?",
                      size: AppConstant.normalText,
                      weight: FontWeight.w500),
                  KHeight(height: AppConstant.largeSpace),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SyllabusPage(),
                          ));
                    },
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          color: AppConstant.secondaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text('Syllabus'),
                      ),
                    ),
                  ),
                  //                 Row(children: [
                  // MenuStudent(),
                  //   MenuStudent(),
                  //                 ],),
                  // MenuStudent(
                  //     imagePath: 'assets/images/lesson.png',
                  //     titre: "Syllabus",
                  //     function: () {

                  //     },
                  //     description: "learn your lessons"),
                  KHeight(height: AppConstant.largeSpace),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Exams(),
                          ));
                    },
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          color: AppConstant.secondaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text('Exams'),
                      ),
                    ),
                  ),
                  // MenuStudent(
                  //     function: () => Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const Exams(),
                  //         )),
                  //     imagePath: 'assets/images/exams.png',
                  //     titre: "Exams",
                  //     description: "for test learn your lessons"),
                  KHeight(height: AppConstant.largeSpace),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProgressPage(),
                          ));
                    },
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          color: AppConstant.secondaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text('Progress'),
                      ),
                    ),
                  ),
                  KHeight(height: AppConstant.largeSpace),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DigitalInkView(),
                          ));
                    },
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          color: AppConstant.secondaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text('Scribble Pad'),
                      ),
                    ),
                  ),
                  KHeight(height: AppConstant.largeSpace),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OcrPage(),
                          ));
                    },
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          color: AppConstant.secondaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text('OCR - Text to Audio'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
      drawer: Drawer(
        semanticLabel: "ohooo",
        child: ListView(children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: AppConstant.primaryColor,
              ),
              child: Column(
                children: const <Widget>[
                  CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 45),
                  ),
                  KHeight(height: AppConstant.largeSpace),
                  KText(
                    size: AppConstant.titleText,
                    text: "Folly Habib MESSAN",
                    color: AppConstant.whiteTextColor,
                  )
                ],
              )),
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profil(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.man),
            title: const Text('My Teacher'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyTeacher()));
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()));
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.power_settings_new_outlined),
            title: const Text('Logout'),
            onTap: () async {
              await AuthService.signOut();
              // Update the state of the app.
              // ...
            },
          ),
        ]),
      ),
    );
  }
}

class MenuStudent extends StatelessWidget {
  final String titre;
  final String imagePath;
  final String description;
  final VoidCallback? function;
  const MenuStudent({
    required this.titre,
    required this.imagePath,
    required this.description,
    this.function,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: function,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        width: double.infinity,
        height: 120,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            // gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            //   Colors.purple.shade700,
            //   Colors.purple.shade500,
            //   Colors.purple.shade300
            // ])
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    KText(
                      weight: FontWeight.w600,
                      size: AppConstant.leadingText,
                      text: titre,
                      color: AppConstant.titleTextColor,
                    ),
                  ]),
                  Row(
                    children: [
                      FittedBox(
                        child: KText(
                            size: AppConstant.titleText,
                            text: description,
                            color: AppConstant.bodyTextColor),
                      ),
                    ],
                  )
                ],
              ),
              Image.asset(imagePath)
            ],
          ),
        ),
      ),
    );
  }
}