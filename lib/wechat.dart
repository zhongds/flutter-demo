import 'package:flutter/material.dart';

class WechatPage extends StatelessWidget {

  List<Widget> getListContent() {
    List<Widget> arr = [];
    for(var i=0; i < 20; i++) {
      arr.add(ListItem());
    }
    return arr;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this.getListContent(),
    );
  }
}

// card example
class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Image.asset("assets/images/qianxun.jpeg", fit: BoxFit.fill,),
        title: Text("name"),
        subtitle: Text("《千与千寻》是宫崎骏执导、编剧，柊瑠美、入野自由、中村彰男、夏木真理等配音，吉卜力工作室制作的动画电影。", overflow: TextOverflow.ellipsis,),
        trailing: Text(
          "08-01",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget{

  String dateFormat(DateTime dateTime) {
    // TODO 今天的时间，昨天，今年的特殊处理
    // ${dateTime.year.toString()}-
    return "${dateTime.month.toString().padLeft(2,'0')}-${dateTime.day.toString().padLeft(2,'0')}";
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              color: Colors.white,
              image: DecorationImage(
                image: ExactAssetImage("assets/images/qianxun.jpeg"),
                fit: BoxFit.cover,
              )
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 115,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "千寻",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  "《千与千寻》是宫崎骏执导、编剧，柊瑠美、入野自由、中村彰男、夏木真理等配音，吉卜力工作室制作的动画电影。",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Text(
            this.dateFormat((DateTime.now())),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

