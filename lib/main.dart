import 'package:flutter/material.dart';
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
      // theme: ThemeData(
      // ),
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
      appBar: AppBar(
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
        shadowColor: null,
        backgroundColor: null,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(1, 255, 208, 90),
              ),
              margin: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: const [
                            Text('test'),
                            Text('data'),
                          ]
                        ),
                        Expanded(child: Container()),
                        Image.asset('assets/images/ic_people.png', scale: 2.0,)
                      ],
                    )
                  ]),
              ) 
            ),
            Row(
              children: [
                Column(children: const [Text("카카오톡으로 초대하기"), Text("친구랑 정모 나가요 :D 레츠 기릿!")],),
                Expanded(child: Container()),
                SvgPicture.asset('assets/images/ic_people.svg', width: 140, height: 80,)
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: IconButton(
            icon: Image.asset('assets/images/ic_people.svg'),
            iconSize: 50,
            onPressed: () {},
          ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
