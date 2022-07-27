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
}