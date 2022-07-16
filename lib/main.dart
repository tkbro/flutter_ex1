import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: "Flutter Demo",
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
    return materialApp;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children:[
          buildKakaoInvitePanel(),
          buildProfilePanel()
        ],
      )
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        title: Row(
          children: [
            const Text("더보기",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            Expanded(child: Container()),
            SvgPicture.asset(
              'assets/images/ic_setting.svg', 
              height: 25, 
              width: 25,),
            const SizedBox(width: 25),
            SvgPicture.asset(
              'assets/images/ic_alert.svg',
              height: 25,
              width: 25,
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      );
  }

  Widget buildKakaoInvitePanel() {
    return Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 208, 90, 1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color.fromRGBO(255, 208, 90, 1), width: 3)
            ),
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('카카오톡으로 초대하기', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                        Text('친구랑 정모 나가요 :D 레츠 기릿!', style: TextStyle(color: Colors.black, fontSize: 12), textAlign: TextAlign.start)
                      ]
                    ),
                    Expanded(child: Container()),
                    Image.asset('assets/images/ic_people.png', scale: 2.0,)
                  ],
                )
              ])
          );
  }

  Widget buildProfilePanel() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/Ellipse 5.svg', width: 80, height: 80,),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: 40,
                child: Row(
                  children: const [
                    Text('홍길동', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                    SizedBox(width: 5),
                    Text('1900.1.23', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.w300),)
                  ])
              ),
              Container(
                height: 40,
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/ic_point.svg', width: 10, height: 20,),
                    const SizedBox(width: 3,),
                    const Text('경기도'),
                    const SizedBox(width: 12)
                  ]),
              )
            ],
          ),
          Expanded(child: Container()),
          Column(children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              alignment: Alignment.center,
              height: 40, 
              child: const Text('수정', style: TextStyle(fontSize: 15, decoration: TextDecoration.underline))
            ),
            const SizedBox(height: 40)
          ])
        ]),
    );
  }
}
