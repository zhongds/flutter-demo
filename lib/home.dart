import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;

  void _changeCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wechat Demo"),
      ),
      body: Center(
        child: Text("index $_currentIndex"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          currentIndex: _currentIndex,
          onTap: _changeCurrentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("微信")),
            BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("通讯录")),
            BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("发现")),
            BottomNavigationBarItem(icon: Icon(Icons.print), title: Text("我")),
          ]
      ),
    );
  }
}

