import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

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
  int _selectedIndex = 0;
  Color _bannerColor = Color.fromRGBO(255, 208, 90, 1);
  final List<String> _menuStringList = const [
    '내 찜 모임',
    '최근 본 모임',
    '프리미엄 모임',
    '클래스 만들기',
    '파워 유저'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children:[
          GestureDetector(
            child: buildKakaoInvitePanel(),
            onTap: () => {
              setState(() {
                _bannerColor = getRandomColor();
              })
            },
          ),
          buildProfilePanel(),
          buildMyFavorPanel(),
          buildMenuListPanel(),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(_selectedIndex),
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
              color: _bannerColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _bannerColor, width: 3)
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                // margin: const EdgeInsets.only(left: 10),
                height: 40,
                child: Row(
                  children: const [
                    Text('홍길동', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                    SizedBox(width: 5),
                    Text('1900.1.23', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.w300),)
                  ])
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 40,
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/ic_point.svg', width: 10, height: 20,),
                    const SizedBox(width: 3,),
                    const Text('경기도')
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

  Widget buildMyFavorPanel() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8 
            ),
            child: Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  var path = '';
                  if (index % 3 == 0) {
                    path = 'assets/images/ic_exercise.png';
                  } else if (index % 3 == 1) {
                    path = 'assets/images/ic_backpack.png';
                  } else {
                    path = 'assets/images/ic_cup.png';
                  }
                  
                  return Container(margin: const EdgeInsets.only(left: 5), child: Image.asset(path, scale: 2.0));
                }),
              )
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center, 
              child: Text("편집", style: TextStyle(fontSize: 15, decoration: TextDecoration.underline))
            )
          )
        ])
    );
  }

  Widget buildMenuListPanel() {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _menuStringList.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(_menuStringList[index], style: const TextStyle(fontSize: 20)),
                  trailing: SvgPicture.asset('assets/images/ic_right_arrow.svg', width: 7, height: 12),
                ),
                const Divider(indent: 10, endIndent: 10,)
              ]
            );
          }),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(int index) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black54,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem> [
        BottomNavigationBarItem(icon: buildPadding3SvgPicture('assets/images/ic_class.svg', 16, 17), label: '클래스'),
        BottomNavigationBarItem(icon: buildPadding3SvgPicture('assets/images/ic_search.svg', 16, 16), label: '소모임'),
        BottomNavigationBarItem(icon: buildPadding3SvgPicture('assets/images/ic_message.svg', 22, 16), label: '내모임'),
        BottomNavigationBarItem(icon: buildPadding3SvgPicture('assets/images/ic_more.svg', 14, 2), label: '더보기'),
      ],
      currentIndex: index,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildPadding3SvgPicture(String path, double width, double height) {
    return Container(
      margin: const EdgeInsets.all(3),
      child: SvgPicture.asset(path, width: width, height: height),
    );
  }

  Color getRandomColor() {
    var random = Random();
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
    return Color.fromRGBO(r, g, b, 1);
  }
}
