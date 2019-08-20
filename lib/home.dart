import 'package:flutter/material.dart';

import './wechat.dart';
import './addrBook.dart';
import './discovery.dart';
import './me.dart';

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
      appBar: getAppBar(_currentIndex),
      body: Center(
        child: getBodyContent(this._currentIndex),
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

enum _Settings { groupCaht, add, scan, pay, help }

void onTab() {
  print("11111");
}

Widget getAppBar(int index) {
  String title;
  switch(index) {
    case 0:
      title = "微信(20)";
      break;
    case 1:
      title = "通讯录";
      break;
    case 2:
      title = "发现";
      break;
    case 3:
      title = "我";
      break;
  }
  return AppBar(
//    backgroundColor: Colors.white,
    title: Text("$title", style: TextStyle(color: Colors.black87)),
    centerTitle: true,
    automaticallyImplyLeading: false,

    actions: <Widget>[
      IconButton(icon: Icon(Icons.search), onPressed: null),
//      IconButton(icon: Icon(Icons.add_circle_outline), onPressed: null,),
  // This is the type used by the popup menu below.

// This menu button widget updates a _selection field (of type _Settings,
// not shown here).
      PopupMenuButton<_Settings>(
        onSelected: (_Settings val) { },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<_Settings>>[
          const PopupMenuItem<_Settings>(
            value: _Settings.groupCaht,
            child: Text("发起群聊"),
          ),
          const PopupMenuItem<_Settings>(
            value: _Settings.add,
            child: Text('添加朋友'),
          ),
          const PopupMenuItem<_Settings>(
            value: _Settings.scan,
            child: Text('扫一扫'),
          ),
          const PopupMenuItem<_Settings>(
            value: _Settings.pay,
            child: Text('收付款'),
          ),
          const PopupMenuItem<_Settings>(
            value: _Settings.help,
            child: Text('帮助与反馈'),
          ),
        ],
      )

    ],
  );
}

Widget getBodyContent(int index) {
  Widget content;
  switch(index) {
    case 0:
      content = WechatPage();
      break;
    case 1:
      content = AddrBookPage();
      break;
    case 2:
      content = DiscoveryhPage();
      break;
    case 3:
      content = MePage();
      break;
  }
  return content;
}
