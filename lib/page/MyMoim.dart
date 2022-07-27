import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyMoimPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => MyMoimState();
}

class MyMoimState extends State<MyMoimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          buildAdPanel(),
          buildRecommendMoinListPanel(),
          buildJoinedMoinListPanel(),
          buildMoimCategoryPanel()
        ]),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        title: Row(
          children: [
            const Text("내 모임",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            Expanded(child: Container()),
            SvgPicture.asset(
              'assets/images/ic_search.svg', 
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

  Widget buildAdPanel() {
    return Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            height: 60,
            child: const FittedBox(
              fit: BoxFit.contain,
              child: Text('광고', textAlign: TextAlign.center),
            )
          );
  }

  Widget buildRecommendMoinListPanel() {
    const String dummyTitle = '비전공자 flutter 앱만들기';
    return buildCommonList(
      dummyTitle, SvgPicture.asset('assets/images/ic_right_arrow.svg', width: 7, height: 12));
  }

  Widget buildJoinedMoinListPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('가입한 모임',
           style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          textAlign: TextAlign.start,
        ),
        buildCommonList('애매앰애맹애맹매매', const Text('10 명'))
      ],
    );
  }

  Widget buildMoimCategoryPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('모임찾기',
           style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          textAlign: TextAlign.start,
        ),
        // ExpansionPanelList(
        //   elevation: 4,
        //   children: [],
        // )
      ],
    );
  }

  ListView buildCommonList(String dummyTitle, Widget trailing) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 50, 
            height: 50, 
            decoration: BoxDecoration(
              color: const Color.fromRGBO(80, 153, 254, 1),
              borderRadius: BorderRadius.circular(10)
            )
          ),
          subtitle: Text("$dummyTitle$index"),
          title: Row(children: [
            SvgPicture.asset('assets/images/Mask group.svg', width: 10, height: 10,),
            const Text('성남시', style: TextStyle(
                color: Color.fromRGBO(96, 101, 129, 1),
                fontSize: 13
              )
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.circular(3)
              ),
              margin: const EdgeInsets.only(left: 2),
              padding: const EdgeInsets.all(2),
              child: const Text('NEW', style: TextStyle(
                  color: Colors.white,
                  fontSize: 8
                )),
            )
          ]), 
          trailing: trailing,
        );
      });
  }
}